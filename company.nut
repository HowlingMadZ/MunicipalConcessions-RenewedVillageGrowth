enum Statistics
{
    GROWTH_POINTS,
    BIGGEST_TOWN,
    FASTEST_GROWING_TOWN,
    AVERAGE_CATEGORY,
    NUM_TOWNS,
    NUM_NOT_GROWING_TOWNS,
    END
}

class Company
{
    id = null;              // company id
    points = null;          // achieved points from growing towns
    statistics = null;      // contains texts for statistics in goal gui
    global_goal = null;     // global goal showing achieved points in the goal gui
    sp_welcome = null;      // story page welcome
    // Municipal concession system
    claimed_towns = null;   // array of town IDs this company has claimed
    station_count = null;   // cached station count for detecting new builds
    demolish_queue = null;  // array of {station_id, demolish_date} for unauthorized stations
    slot_goal = null;       // goal GUI entry for concessions
    // Station tier lists: {station_id -> town_id} tables
    stations_in_zone = null;  // stations within a town's municipal zone
    stations_near = null;     // stations within 2x zone radius of nearest town but outside zone
    stations_far = null;      // stations beyond 2x zone radius from nearest town

    constructor(id, load_data)
    {
        this.id = id;

        if (!load_data)
        {
            this.points = 0;
            this.claimed_towns = [];
            this.demolish_queue = [];
            this.slot_goal = null;
            this.station_count = 0;
            this.stations_in_zone = {};
            this.stations_near = {};
            this.stations_far = {};

            // Initialize station count and build tier lists
            // Scoped so company_mode ends before InitGUIGoals which needs deity mode
            {
                local company_mode = GSCompanyMode(this.id);
                local existing_stations = GSStationList(GSStation.STATION_ANY);
                this.station_count = existing_stations.Count();

                // Classify existing stations and pre-claim towns
                foreach (station_id, _ in existing_stations) {
                    this.ClassifyStation(station_id);
                }
            }

            this.InitGUIGoals();
        }
        else
        {
            this.points = ::CompanyDataTable[this.id].points;
            this.global_goal = ::CompanyDataTable[this.id].global_goal;
            this.statistics = ::CompanyDataTable[this.id].statistics;
            this.claimed_towns = ::CompanyDataTable[this.id].rawin("claimed_towns") ? ::CompanyDataTable[this.id].claimed_towns : [];
            this.demolish_queue = ::CompanyDataTable[this.id].rawin("demolish_queue") ? ::CompanyDataTable[this.id].demolish_queue : [];
            this.slot_goal = null;
            this.stations_in_zone = {};
            this.stations_near = {};
            this.stations_far = {};

            // Rebuild tier lists from actual state
            {
                local company_mode = GSCompanyMode(this.id);
                local existing_stations = GSStationList(GSStation.STATION_ANY);
                this.station_count = existing_stations.Count();

                foreach (station_id, _ in existing_stations) {
                    this.ClassifyStation(station_id);
                }
            }
        }
    }
}

function Company::SavingCompanyData()
{
    local company_data = {};
    company_data.points <- this.points;
    company_data.global_goal <- this.global_goal;
    company_data.statistics <- this.statistics;
    company_data.claimed_towns <- this.claimed_towns;
    company_data.station_count <- this.station_count;
    company_data.demolish_queue <- this.demolish_queue;

    return company_data;
}

function Company::InitGUIGoals()
{
    // In multiplayer, pause level cannot be changed, so skip initialization of Goals GUI
    local pause_level = GSGameSettings.GetValue("construction.command_pause_level");
    if (GSGame.IsPaused() && GSGame.IsMultiplayer() && pause_level < 1)
        return false;

    // If it is not set, temporarily allow all non-construction actions during pause
    if (pause_level < 1)
        GSGameSettings.SetValue("construction.command_pause_level", 1);

    // global goal
    this.global_goal = GSGoal.New(GSCompany.COMPANY_INVALID, GSText(GSText.STR_STATISTICS_GROWTH_POINTS, GetColorText(this.id), this.id), GSGoal.GT_NONE, 0);
    GSGoal.SetProgress(this.global_goal, GSText(GSText.STR_NUM, this.points));

    // statistics
    this.statistics = array(Statistics.END, -1);

    this.statistics[Statistics.GROWTH_POINTS] = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_GROWTH_POINTS, GetColorText(this.id), this.id), GSGoal.GT_NONE, 0);
    GSGoal.SetProgress(this.statistics[Statistics.GROWTH_POINTS], GSText(GSText.STR_NUM, this.points));

    this.statistics[Statistics.AVERAGE_CATEGORY] = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_AVERAGE_CATEGORY), GSGoal.GT_NONE, 0);
    GSGoal.SetProgress(this.statistics[Statistics.AVERAGE_CATEGORY], GSText(GSText.STR_COMMA, 0));

    this.statistics[Statistics.NUM_TOWNS] = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_NUM_TOWNS), GSGoal.GT_NONE, 0);
    GSGoal.SetProgress(this.statistics[Statistics.NUM_TOWNS], GSText(GSText.STR_NUM, 0));

    this.statistics[Statistics.NUM_NOT_GROWING_TOWNS] = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_NOT_GROWING), GSGoal.GT_NONE, 0);
    GSGoal.SetProgress(this.statistics[Statistics.NUM_NOT_GROWING_TOWNS], GSText(GSText.STR_NUM, 0));

    // Town slot system
    if (GSController.GetSetting("town_slot_enabled")) {
        this.slot_goal = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_TOWN_SLOTS, this.GetMaxTownSlots()), GSGoal.GT_NONE, 0);
        GSGoal.SetProgress(this.slot_goal, GSText(GSText.STR_NUM, this.claimed_towns.len()));
    }

    // Reset to previous settings
    GSGameSettings.SetValue("construction.command_pause_level", pause_level);

    return true;
}

function Company::RemoveGUIGoals()
{
    // global goal
    GSGoal.Remove(this.global_goal);
}

function Company::AddPoints(points)
{
    if (points <= 0) return;

    local old_points = this.points;
    this.points += points;

    // Check if town slots feature is enabled
    if (GSController.GetSetting("town_slot_enabled")) {
        local points_per_unlock = GSController.GetSetting("points_per_unlock");
        local old_unlocks = old_points / points_per_unlock;
        local new_unlocks = this.points / points_per_unlock;

        if (new_unlocks > old_unlocks) {
            local slots_per_unlock = GSController.GetSetting("slots_per_unlock");
            local new_slots = (new_unlocks - old_unlocks) * slots_per_unlock;
            // Send news to the company
            GSNews.Create(GSNews.NT_ECONOMY, GSText(GSText.STR_TOWN_SLOT_UNLOCKED, new_slots, this.GetMaxTownSlots()), GSCompany.COMPANY_INVALID, GSNews.NR_NONE, 0);
            Log.Info(GSCompany.GetName(this.id) + " unlocked " + new_slots + " new town slots (total: " + this.GetMaxTownSlots() + ")", Log.LVL_INFO);
        }
    }
}

/* Returns the maximum number of town slots for this company based on points */
function Company::GetMaxTownSlots()
{
    local initial = GSController.GetSetting("initial_town_slots");
    local points_per_unlock = GSController.GetSetting("points_per_unlock");
    local slots_per_unlock = GSController.GetSetting("slots_per_unlock");
    return initial + (this.points / points_per_unlock) * slots_per_unlock;
}

/* Returns how many more towns this company can claim */
function Company::GetRemainingSlots()
{
    return this.GetMaxTownSlots() - this.claimed_towns.len();
}

/* Check if a town is already claimed by this company */
function Company::HasClaimedTown(town_id)
{
    foreach (t in this.claimed_towns) {
        if (t == town_id) return true;
    }
    return false;
}

/* Calculate the effective zone radius around a town.
 * This is the town's influence zone setting + station spread,
 * accounting for how far a player could reach into a town via
 * station spreading. */
function Company::GetTownZoneRadius()
{
    local base_radius = GSController.GetSetting("town_zone_radius");
    local station_spread = GSGameSettings.GetValue("station.station_spread");
    return base_radius + station_spread;
}

/* Check if a tile is within the town's zone */
function Company::IsInTownZone(tile, town_id)
{
    local distance = GSTown.GetDistanceManhattanToTile(town_id, tile);
    return distance <= this.GetTownZoneRadius();
}

/* Check if a tile is within the extended town zone (2x radius, used for
 * unauthorized station checks near towns claimed by other companies) */
function Company::IsInExtendedTownZone(tile, town_id)
{
    local distance = GSTown.GetDistanceManhattanToTile(town_id, tile);
    return distance <= (this.GetTownZoneRadius() * 2);
}

/* Check if any company in the list has claimed a specific town */
function IsTownClaimedByAnyone(town_id, companies)
{
    foreach (company in companies) {
        if (company.HasClaimedTown(town_id)) return true;
    }
    return false;
}

/* Classify a single station into the appropriate tier list.
 * Also pre-claims the town if the station is in-zone and we have slots. */
function Company::ClassifyStation(station_id)
{
    if (!GSStation.IsValidStation(station_id)) return;

    local tile = GSBaseStation.GetLocation(station_id);
    local town_id = GSTile.GetClosestTown(tile);
    if (!GSTown.IsValidTown(town_id)) return;

    local distance = GSTown.GetDistanceManhattanToTile(town_id, tile);

    if (distance <= this.GetTownZoneRadius()) {
        // In zone
        this.stations_in_zone[station_id] <- town_id;
        if (!this.HasClaimedTown(town_id)) {
            this.claimed_towns.append(town_id);
        }
    } else if (distance <= this.GetTownZoneRadius() * 2) {
        // Near but outside zone
        this.stations_near[station_id] <- town_id;
    } else {
        // Far away
        this.stations_far[station_id] <- town_id;
    }
}

/* Remove a town from the claimed list */
function Company::ReleaseConcession(town_id)
{
    for (local i = 0; i < this.claimed_towns.len(); i++) {
        if (this.claimed_towns[i] == town_id) {
            this.claimed_towns.remove(i);
            // Notify this company only — use NT_ECONOMY for a full newspaper popup with town viewport
            GSNews.Create(GSNews.NT_ECONOMY, GSText(GSText.STR_TOWN_SLOT_RELEASED, town_id), this.id, GSNews.NR_TOWN, town_id);
            Log.Info(GSCompany.GetName(this.id) + " concession expired in " + GSTown.GetName(town_id) + " - no stations remain", Log.LVL_INFO);
            this.UpdateSlotGoal();
            return;
        }
    }
}

/* Monthly scan: rebuild in-zone and near station lists, check for
 * creeping stations, and release concessions for towns with no stations. */
function Company::MonthlyScanStations(companies)
{
    if (!GSController.GetSetting("town_slot_enabled")) return;
    if (GSCompany.ResolveCompanyID(this.id) == GSCompany.COMPANY_INVALID) return;

    local new_in_zone = {};
    local new_near = {};
    local unauthorized = [];

    // Scan all stations in the in-zone and near lists
    {
        local company_mode = GSCompanyMode(this.id);

        // Re-check all current in-zone stations (they may have been removed)
        foreach (station_id, town_id in this.stations_in_zone) {
            if (!GSStation.IsValidStation(station_id)) continue;
            local tile = GSBaseStation.GetLocation(station_id);
            local current_town = GSTile.GetClosestTown(tile);
            if (!GSTown.IsValidTown(current_town)) continue;

            local distance = GSTown.GetDistanceManhattanToTile(current_town, tile);
            if (distance <= this.GetTownZoneRadius()) {
                new_in_zone[station_id] <- current_town;
            } else if (distance <= this.GetTownZoneRadius() * 2) {
                new_near[station_id] <- current_town;
            }
            // if beyond 2x zone radius, it moved to far — will be caught by yearly scan
        }

        // Re-check all near stations — have any crept into a zone?
        foreach (station_id, town_id in this.stations_near) {
            if (!GSStation.IsValidStation(station_id)) continue;
            local tile = GSBaseStation.GetLocation(station_id);
            local current_town = GSTile.GetClosestTown(tile);
            if (!GSTown.IsValidTown(current_town)) continue;

            local distance = GSTown.GetDistanceManhattanToTile(current_town, tile);
            if (distance <= this.GetTownZoneRadius()) {
                // Crept into zone!
                if (this.HasClaimedTown(current_town)) {
                    // Already claimed, just reclassify
                    new_in_zone[station_id] <- current_town;
                } else if (this.GetRemainingSlots() > 0) {
                    // Has free slot, claim it
                    new_in_zone[station_id] <- current_town;
                    // Will claim below in deity mode
                    unauthorized.append({station_id = station_id, town_id = current_town, action = "claim"});
                } else {
                    // No slot — unauthorized creep!
                    unauthorized.append({station_id = station_id, town_id = current_town, action = "enforce"});
                }
            } else if (distance <= this.GetTownZoneRadius() * 2) {
                new_near[station_id] <- current_town;
            }
        }
    }
    // Back to deity mode

    // Process unauthorized/claim actions
    foreach (entry in unauthorized) {
        if (entry.action == "claim") {
            this.ClaimTown(entry.town_id);
            this.UpdateSlotGoal();
        } else {
            local already_queued = false;
            foreach (dq in this.demolish_queue) {
                if (dq.station_id == entry.station_id) {
                    already_queued = true;
                    break;
                }
            }
            if (!already_queued) {
                this.EnforceTownZone(entry.station_id, entry.town_id);
            }
        }
    }

    // Update tier lists
    this.stations_in_zone = new_in_zone;
    this.stations_near = new_near;

    // Check for concession releases — any claimed town with zero in-zone stations
    local towns_to_release = [];
    foreach (town_id in this.claimed_towns) {
        local has_station = false;
        foreach (sid, tid in this.stations_in_zone) {
            if (tid == town_id) {
                has_station = true;
                break;
            }
        }
        if (!has_station) {
            towns_to_release.append(town_id);
        }
    }
    foreach (town_id in towns_to_release) {
        this.ReleaseConcession(town_id);
    }
}

/* Yearly scan: check far stations, move any that crept within 2x zone radius to near list. */
function Company::YearlyScanStations()
{
    if (!GSController.GetSetting("town_slot_enabled")) return;
    if (GSCompany.ResolveCompanyID(this.id) == GSCompany.COMPANY_INVALID) return;

    local new_far = {};
    local near_radius = this.GetTownZoneRadius() * 2;

    {
        local company_mode = GSCompanyMode(this.id);

        foreach (station_id, town_id in this.stations_far) {
            if (!GSStation.IsValidStation(station_id)) continue;
            local tile = GSBaseStation.GetLocation(station_id);
            local current_town = GSTile.GetClosestTown(tile);
            if (!GSTown.IsValidTown(current_town)) continue;

            local distance = GSTown.GetDistanceManhattanToTile(current_town, tile);
            if (distance <= near_radius) {
                // Moved closer — add to near list for monthly checking
                this.stations_near[station_id] <- current_town;
                Log.Info("Station " + GSBaseStation.GetName(station_id) + " moved within near radius of " + GSTown.GetName(current_town), Log.LVL_DEBUG);
            } else {
                new_far[station_id] <- current_town;
            }
        }
    }

    this.stations_far = new_far;
}

/* Claim a town for this company */
function Company::ClaimTown(town_id)
{
    if (!this.HasClaimedTown(town_id)) {
        this.claimed_towns.append(town_id);
        Log.Info(GSCompany.GetName(this.id) + " claimed town " + GSTown.GetName(town_id) + " (" + this.claimed_towns.len() + "/" + this.GetMaxTownSlots() + " slots)", Log.LVL_INFO);

        // Notify all players — use NT_ECONOMY for a full newspaper popup with town viewport
        GSNews.Create(GSNews.NT_ECONOMY, GSText(GSText.STR_TOWN_SLOT_CLAIMED, this.id, town_id), GSCompany.COMPANY_INVALID, GSNews.NR_TOWN, town_id);
    }
}

/* Destroy an unauthorized station. If delay is 0, destroys immediately.
 * Otherwise queues the destruction for delayed execution. */
function Company::EnforceTownZone(station_id, town_id)
{
    local delay_minutes = GSController.GetSetting("unauthorized_station_delay");
    local station_tile = GSBaseStation.GetLocation(station_id);

    if (delay_minutes == 0) {
        // Send instant notice — use NT_ECONOMY for viewport popup
        GSNews.Create(GSNews.NT_ECONOMY, GSText(GSText.STR_TOWN_SLOT_UNAUTHORIZED_INSTANT, town_id), this.id, GSNews.NR_TILE, station_tile);
        Log.Info(GSCompany.GetName(this.id) + " unauthorized station near " + GSTown.GetName(town_id) + " - destroying instantly", Log.LVL_INFO);

        // Destroy immediately
        this.DestroyStation(station_id);
    } else {
        // Send delayed warning — use NT_ECONOMY for viewport popup
        GSNews.Create(GSNews.NT_ECONOMY, GSText(GSText.STR_TOWN_SLOT_UNAUTHORIZED, town_id, delay_minutes), this.id, GSNews.NR_TILE, station_tile);
        Log.Info(GSCompany.GetName(this.id) + " unauthorized station near " + GSTown.GetName(town_id) + " - will be destroyed in " + delay_minutes + " minutes", Log.LVL_INFO);

        // Queue for delayed destruction
        local demolish_date = GSDate.GetCurrentDate() + (delay_minutes * 30);
        this.demolish_queue.append({
            station_id = station_id,
            demolish_date = demolish_date,
            town_id = town_id
        });
    }
}

/* Destroy an unauthorized station entirely. */
function Company::DestroyStation(station_id)
{
    if (!GSStation.IsValidStation(station_id)) return;

    local name = GSBaseStation.GetName(station_id);

    {
        local company_mode = GSCompanyMode(this.id);
        local tile_list = GSTileList_StationType(station_id, GSStation.STATION_ANY);

        foreach (tile, _ in tile_list) {
            if (GSRail.IsRailStationTile(tile)) {
                GSRail.RemoveRailStationTileRectangle(tile, tile, false);
            } else if (GSRoad.IsRoadStationTile(tile)) {
                GSRoad.RemoveRoadStation(tile);
            } else {
                GSTile.DemolishTile(tile);
            }
        }
    }

    // Remove from tier lists so the ID doesn't linger
    if (station_id in this.stations_in_zone) delete this.stations_in_zone[station_id];
    if (station_id in this.stations_near)   delete this.stations_near[station_id];
    if (station_id in this.stations_far)    delete this.stations_far[station_id];

    Log.Info("Destroyed station " + name + " (unauthorized)", Log.LVL_INFO);
}

/* Process the demolish queue - called daily. Destroys unauthorized
 * stations once their grace period expires. */
function Company::ProcessDemolishQueue()
{
    local current_date = GSDate.GetCurrentDate();
    local i = 0;
    while (i < this.demolish_queue.len()) {
        local entry = this.demolish_queue[i];
        if (current_date >= entry.demolish_date) {
            this.DestroyStation(entry.station_id);
            this.demolish_queue.remove(i);
        } else {
            i++;
        }
    }
}

/* Monitor for new station builds and enforce town slots */
function Company::MonitorStations(towns, companies)
{
    if (!GSController.GetSetting("town_slot_enabled")) return;
    if (GSCompany.ResolveCompanyID(this.id) == GSCompany.COMPANY_INVALID) return;

    // Process pending demolitions
    this.ProcessDemolishQueue();

    // Check for new stations - need company mode to get this company's station list
    local current_count = 0;
    local new_town_stations = []; // array of {station_id, town_id} for stations in unclaimed towns
    local new_stations_to_classify = []; // all genuinely new station IDs

    // Purge invalid/destroyed stations from tier lists first, so that
    // if the game reuses a station ID we will notice it as "new".
    foreach (station_id, _ in this.stations_in_zone) {
        if (!GSStation.IsValidStation(station_id))
            delete this.stations_in_zone[station_id];
    }
    foreach (station_id, _ in this.stations_near) {
        if (!GSStation.IsValidStation(station_id))
            delete this.stations_near[station_id];
    }
    foreach (station_id, _ in this.stations_far) {
        if (!GSStation.IsValidStation(station_id))
            delete this.stations_far[station_id];
    }

    {
        local company_mode = GSCompanyMode(this.id);
        local station_list = GSStationList(GSStation.STATION_ANY);
        current_count = station_list.Count();

        // Compare current count against known stations rather than cached
        // count. After a destroy-and-rebuild the total count can stay the
        // same while a new (or reused) station ID appears.
        local known_count = this.stations_in_zone.len()
                          + this.stations_near.len()
                          + this.stations_far.len();

        this.station_count = current_count;

        if (current_count <= known_count) {
            // No unknown stations — nothing to do
            return;
        }

        local has_free_slots = this.GetRemainingSlots() > 0;

        foreach (station_id, _ in station_list) {
            // Skip stations we already know about
            if (station_id in this.stations_in_zone) continue;
            if (station_id in this.stations_near) continue;
            if (station_id in this.stations_far) continue;

            // This is a genuinely new station — classify it
            new_stations_to_classify.append(station_id);

            local tile = GSBaseStation.GetLocation(station_id);
            local town_id = GSTile.GetClosestTown(tile);
            if (!GSTown.IsValidTown(town_id)) continue;

            // If we already claimed this town, it's fine
            if (this.HasClaimedTown(town_id)) continue;

            if (has_free_slots) {
                if (!this.IsInTownZone(tile, town_id)) continue;
            } else {
                if (IsTownClaimedByAnyone(town_id, companies)) {
                    if (!this.IsInExtendedTownZone(tile, town_id)) continue;
                } else {
                    if (!this.IsInTownZone(tile, town_id)) continue;
                }
            }

            new_town_stations.append({station_id = station_id, town_id = town_id});
        }
    }
    // company_mode is now out of scope - back to deity mode for news/goals

    // Classify new stations into tier lists
    foreach (station_id in new_stations_to_classify) {
        if (!GSStation.IsValidStation(station_id)) continue;
        local tile = GSBaseStation.GetLocation(station_id);
        local town_id = GSTile.GetClosestTown(tile);
        if (!GSTown.IsValidTown(town_id)) continue;

        local distance = GSTown.GetDistanceManhattanToTile(town_id, tile);
        if (distance <= this.GetTownZoneRadius()) {
            this.stations_in_zone[station_id] <- town_id;
        } else if (distance <= this.GetTownZoneRadius() * 2) {
            this.stations_near[station_id] <- town_id;
        } else {
            this.stations_far[station_id] <- town_id;
        }
    }

    // Process the new stations found in unclaimed towns
    foreach (entry in new_town_stations) {
        if (this.GetRemainingSlots() > 0) {
            this.ClaimTown(entry.town_id);
            // Update Goals GUI immediately
            this.UpdateSlotGoal();
        } else {
            // Check if this station is already in the demolish queue
            local already_queued = false;
            foreach (dq in this.demolish_queue) {
                if (dq.station_id == entry.station_id) {
                    already_queued = true;
                    break;
                }
            }
            if (!already_queued) {
                this.EnforceTownZone(entry.station_id, entry.town_id);
            }
        }
    }
}

/* Update the town slot goal display immediately */
function Company::UpdateSlotGoal()
{
    if (!GSController.GetSetting("town_slot_enabled")) return;

    if (this.slot_goal == null || !GSGoal.IsValidGoal(this.slot_goal)) {
        this.slot_goal = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_TOWN_SLOTS, this.GetMaxTownSlots()), GSGoal.GT_NONE, 0);
    } else {
        GSGoal.SetText(this.slot_goal, GSText(GSText.STR_STATISTICS_TOWN_SLOTS, this.GetMaxTownSlots()));
    }
    GSGoal.SetProgress(this.slot_goal, GSText(GSText.STR_NUM, this.claimed_towns.len()));
}

function Company::MonthlyUpdateGUIGoals(towns)
{
    // Check if Goals GUI is initialized and can be initialized
    if (this.statistics == null || this.global_goal == null) {
        if (!this.InitGUIGoals()) {
            return;
        }
    }

    local biggest_town = -1;
    local biggest_town_population = 0;
    local fastest_growth_town = -1;
    local fastest_growth = 1000;
    local average_category_total = 0;
    local num_towns = 0;
    local num_not_growing_towns = 0;

    foreach (town in towns) {
        if (town.contributor != this.id)
            continue;
        
        local population = GSTown.GetPopulation(town.id);
        if (population > biggest_town_population) {
            biggest_town_population = population;
            biggest_town = town.id;
        }

        if (town.tgr_average != null && town.tgr_average > 0 && town.tgr_average < fastest_growth && town.allowGrowth) {
            fastest_growth = town.tgr_average;
            fastest_growth_town = town.id;
        }

        local max_cat = 0;
        while (max_cat < ::CargoCatNum-1) {
            if (town.town_goals_cat[max_cat + 1] == 0) break;
            max_cat++;
        }
        average_category_total += max_cat + 1;

        ++num_towns;
        if (!town.allowGrowth)
            ++num_not_growing_towns;
    }

    // Global
    GSGoal.SetText(this.global_goal, GSText(GSText.STR_STATISTICS_GROWTH_POINTS, GetColorText(this.id), this.id));
    GSGoal.SetProgress(this.global_goal, GSText(GSText.STR_NUM, this.points));

    // Statistics
    GSGoal.SetText(this.statistics[Statistics.GROWTH_POINTS], GSText(GSText.STR_STATISTICS_GROWTH_POINTS, GetColorText(this.id), this.id));
    GSGoal.SetProgress(this.statistics[Statistics.GROWTH_POINTS], GSText(GSText.STR_NUM, this.points));

    if (GSTown.IsValidTown(biggest_town)) {
        if (!GSGoal.IsValidGoal(this.statistics[Statistics.BIGGEST_TOWN]))
            this.statistics[Statistics.BIGGEST_TOWN] = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_BIGGEST_TOWN, biggest_town), GSGoal.GT_NONE, 0);
        else
            GSGoal.SetText(this.statistics[Statistics.BIGGEST_TOWN], GSText(GSText.STR_STATISTICS_BIGGEST_TOWN, biggest_town));
        GSGoal.SetProgress(this.statistics[Statistics.BIGGEST_TOWN], GSText(GSText.STR_NUM, biggest_town_population));
    }
    else if (GSGoal.IsValidGoal(this.statistics[Statistics.BIGGEST_TOWN])) {
        GSGoal.Remove(this.statistics[Statistics.BIGGEST_TOWN]);
        this.statistics[Statistics.BIGGEST_TOWN] = -1;
    }

    if (GSTown.IsValidTown(fastest_growth_town)) {
        if (!GSGoal.IsValidGoal(this.statistics[Statistics.FASTEST_GROWING_TOWN]))
            this.statistics[Statistics.FASTEST_GROWING_TOWN] = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_GROWTH_TOWN, fastest_growth_town), GSGoal.GT_NONE, 0);
        else
            GSGoal.SetText(this.statistics[Statistics.FASTEST_GROWING_TOWN], GSText(GSText.STR_STATISTICS_GROWTH_TOWN, fastest_growth_town));
        GSGoal.SetProgress(this.statistics[Statistics.FASTEST_GROWING_TOWN], GSText(GSText.STR_NUM, fastest_growth));
    }
    else if (GSGoal.IsValidGoal(this.statistics[Statistics.FASTEST_GROWING_TOWN])) {
        GSGoal.Remove(this.statistics[Statistics.FASTEST_GROWING_TOWN]);
        this.statistics[Statistics.FASTEST_GROWING_TOWN] = -1;
    }

    local average_category = num_towns > 0 ? (average_category_total.tofloat() / num_towns * 1000).tointeger() : 0;
    GSGoal.SetProgress(this.statistics[Statistics.AVERAGE_CATEGORY], GSText(GSText.STR_COMMA, average_category));
    GSGoal.SetProgress(this.statistics[Statistics.NUM_TOWNS], GSText(GSText.STR_NUM, num_towns));
    GSGoal.SetProgress(this.statistics[Statistics.NUM_NOT_GROWING_TOWNS], GSText(GSText.STR_NUM, num_not_growing_towns));

    // Town slot system display
    if (GSController.GetSetting("town_slot_enabled")) {
        if (this.slot_goal == null || !GSGoal.IsValidGoal(this.slot_goal)) {
            this.slot_goal = GSGoal.New(this.id, GSText(GSText.STR_STATISTICS_TOWN_SLOTS, this.GetMaxTownSlots()), GSGoal.GT_NONE, 0);
        } else {
            GSGoal.SetText(this.slot_goal, GSText(GSText.STR_STATISTICS_TOWN_SLOTS, this.GetMaxTownSlots()));
        }
        GSGoal.SetProgress(this.slot_goal, GSText(GSText.STR_NUM, this.claimed_towns.len()));
    }
}

function GetColorText(company_id)
{
    if (GSCompany.ResolveCompanyID(company_id) == GSCompany.COMPANY_INVALID)
        return GSText(GSText.STR_SILVER);

    local dummy = GSCompanyMode(company_id);
    local color = GSCompany.GetPrimaryLiveryColour(GSCompany.LS_DEFAULT);
    switch (color)
    {
        case GSCompany.COLOUR_DARK_BLUE:
            return GSText(GSText.STR_DARK_BLUE);
        case GSCompany.COLOUR_PALE_GREEN:
            return GSText(GSText.STR_PALE_GREEN);
        case GSCompany.COLOUR_PINK:
            return GSText(GSText.STR_PINK);
        case GSCompany.COLOUR_YELLOW:
            return GSText(GSText.STR_YELLOW);
        case GSCompany.COLOUR_RED:
            return GSText(GSText.STR_RED);
        case GSCompany.COLOUR_LIGHT_BLUE:
            return GSText(GSText.STR_LIGHT_BLUE);
        case GSCompany.COLOUR_GREEN:
            return GSText(GSText.STR_GREEN);
        case GSCompany.COLOUR_DARK_GREEN:
            return GSText(GSText.STR_DARK_GREEN);
        case GSCompany.COLOUR_BLUE:
            return GSText(GSText.STR_BLUE);
        case GSCompany.COLOUR_CREAM:
            return GSText(GSText.STR_CREAM);
        case GSCompany.COLOUR_MAUVE:
            return GSText(GSText.STR_MAUVE);
        case GSCompany.COLOUR_PURPLE:
            return GSText(GSText.STR_PURPLE);
        case GSCompany.COLOUR_ORANGE:
            return GSText(GSText.STR_ORANGE);
        case GSCompany.COLOUR_BROWN:
            return GSText(GSText.STR_BROWN);
        case GSCompany.COLOUR_GREY:
            return GSText(GSText.STR_GREY);
        case GSCompany.COLOUR_WHITE:
            return GSText(GSText.STR_WHITE);
        default:
            return GSText(GSText.STR_SILVER);
    }
}