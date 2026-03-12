enum CatLabels
{
    PUBLIC_SERVICES = 0,
    RAW_FOOD = 1,
    RAW_MATERIALS = 2,
    PROCESSED_MATERIALS = 3,
    FINAL_PRODUCTS = 4,
    PRODUCTS = 5,
    LOCAL_PRODUCTION = 6,
    IMPORTED_GOODS = 7,
    CATEGORY_I = 8,
    CATEGORY_II = 9,
    CATEGORY_III = 10,
    CATEGORY_IV = 11,
    CATEGORY_V = 12,
    RAW_AND_FOOD = 13,
    REFINED_MATS = 14,
    MANUFACTORING_COMPS = 15,
    FINAL_AND_VEHICLES = 16
}

enum Economies
{
    NONE,
    BASESET__TEMPERATE,
    BASESET__ARCTIC,
    BASESET__TROPICAL,
    BASESET__TOYLAND,
    FIRS1__FIRS_ECONOMY, // 1.4
    FIRS1__TEMPERATE_BASIC, // 1.4
    FIRS1__ARCTIC_BASIC, // 1.4
    FIRS1__TROPIC_BASIC, // 1.4
    FIRS1__HEARTH_OF_DARKNESS, // 1.4
    ECS, // 1.2
    FIRS2__TEMPERATE_BASIC, // 2.1.5
    FIRS2__ARCTIC_BASIC, // 2.1.5
    FIRS2__TROPIC_BASIC, // 2.1.5
    FIRS2__IN_A_HOT_COUNTRY, // 2.1.5
    FIRS2__EXTREME, // 2.1.5
    YETI, // 0.1.6
    FIRS3__TEMPERATE_BASIC, // 3.0.12
    FIRS3__ARCTIC_BASIC, // 3.0.12
    FIRS3__TROPIC_BASIC, // 3.0.12
    FIRS3__STEELTOWN, // 3.0.12
    FIRS3__IN_A_HOT_COUNTRY, // 3.0.12 and 4.0.0 - 4.1.x
    FIRS3__EXTREME, // 3.0.12
    NAIS__NORTH_AMERICA, // 1.0.6
    ITI, // 1.6
    FIRS4__TEMPERATE_BASIC, // 4.3.0
    FIRS4__ARCTIC_BASIC, // 4.3.0
    FIRS4__TROPIC_BASIC, // 4.3.0
    FIRS4__STEELTOWN, // 4.3.0
    FIRS4__IN_A_HOT_COUNTRY, // 4.3.0
    FIRS5__TEMPERATE_BASIC, // 5.0.0
    FIRS5__ARCTIC_BASIC, // 5.0.0
    FIRS5__TROPIC_BASIC, // 5.0.0
    FIRS5__STEELTOWN, // 5.0.0
    FIRS5__IN_A_HOT_COUNTRY, // 5.0.0
    XIS__THE_LOT, // 0.6
    AXIS__STEELTOWN, // 2.2.0
    AXIS__TROPICAL_PARADISE, // 2.2.0
    OTIS, // 05
    IOTC, // 0.1.4
    LUMBERJACK, // 0.1.0
    WRBI, // 1200
    ITI2, // 2.14
    REAL, // Real Industries Beta
    MINIMALIST, // 1.1
    PIRS, // PIRS 2022
	GIST, // GIST 0.19.1 - 2025
    END,
}

/* Cargolist of supported industry set's cargos. Used to check if
 * initial ingame cargo list matches the defined setting. Needs to be
 * updated if industry set cargos change.
 */
function GetEconomyCargoList(economy, cargo_list) {
    switch (economy) {
    /* Baseset */
    case(Economies.BASESET__TEMPERATE): // Temperate
        return ["PASS","COAL","MAIL","OIL_","LVST","GOOD",
                "GRAI","WOOD","IORE","STEL","VALU"];
    case(Economies.BASESET__ARCTIC): // Arctic
        return ["PASS","COAL","MAIL","OIL_","LVST","GOOD",
                "WHEA","WOOD",  null,"PAPR","GOLD","FOOD"];
    case(Economies.BASESET__TROPICAL): // Tropical
        return ["PASS","RUBR","MAIL","OIL_","FRUT","GOOD",
                "MAIZ","WOOD","CORE","WATR","DIAM","FOOD"];
    case(Economies.BASESET__TOYLAND): // Toyland
        return ["PASS","SUGR","MAIL","TOYS","BATT","SWET",
                "TOFF","COLA","CTCD","BUBL","PLST","FZDR"];
    /* FIRS version 1.4 */
    case(Economies.FIRS1__FIRS_ECONOMY): // Firs economy
        return ["PASS","COAL","MAIL","OIL_","LVST","GOOD","GRAI","WOOD","IORE","STEL",
                "MILK","FOOD","SGBT","FRUT","FISH","WOOL","CLAY","SAND","MNSP","WDPR",
                "SCMT","FMSP","FICR","RFPR","ENSP","PETR","GRVL","AORE","BDMT","BEER",
                  null,"RCYC"];
    case(Economies.FIRS1__TEMPERATE_BASIC): // Temperate basic
        return ["PASS","COAL","MAIL",  null,"LVST","GOOD",  null,  null,"IORE","STEL",
                  "MILK","FOOD",  null,"FRUT",  null,  null,"CLAY","SAND","MNSP",  null,
                  "SCMT","FMSP",  null,"RFPR","ENSP",  null,  null,  null,  null,"BEER"];
    case(Economies.FIRS1__ARCTIC_BASIC): // Arctic basic
        return ["PASS",  null,"MAIL","OIL_","LVST","GOOD","GRAI","WOOD","IORE",  null,
                  null,"FOOD",  null,"PAPR","FISH",  null,"CLAY",  null,"MNSP",  null,
                  null,"FMSP",  null,"RFPR","ENSP","PETR",  null,  null,  null,"BEER"];
    case(Economies.FIRS1__TROPIC_BASIC): // Tropic basic
        return ["PASS",  null,"MAIL","OIL_","LVST","GOOD","BEAN",  null,  null,  null,
                "JAVA","FOOD","SGBT","FRUT",  null,"WOOL",  null,"NITR","MNSP","VPTS",
                  null,"FMSP",  null,"RFPR","ENSP",  null,  null,"AORE"];
    case(Economies.FIRS1__HEARTH_OF_DARKNESS): // Hearth of Darkness
        return ["PASS","DIAM","MAIL","OIL_",  null,"GOOD","GRAI","WOOD","CORE",  null,
                "JAVA","FOOD","SGBT","FRUT","FISH",  null,  null,  null,"MNSP",  null,
                "SUGR","FMSP","FICR",  null,"ENSP",  null,  null,"RUBR","BDMT","BEER"];
    /* ECS - Included vectors:
     * ECS Town vector 1.2
     * ECS Houses 1.2
     * ECS Basic vector II 1.2
     * ECS Chemicals vector II 1.2
     * ECS Machinery Vector 1.2
     * ECS Wood vector 1.2
     * ECS Agricultural vector 1.2
     */
    case(Economies.ECS):
        return this.ConstructECSVectorCargoList(cargo_list);
    /*FIRS version 2.1.5 */
    case(Economies.FIRS2__TEMPERATE_BASIC): // Temperate Basic
        return ["PASS","BEER","MAIL","RFPR","CLAY","GOOD","COAL","ENSP","FMSP","FISH",
                "FRUT","FOOD","IORE","LVST","MNSP","STEL","MILK","SAND","SCMT"];
    case(Economies.FIRS2__ARCTIC_BASIC): // Arctic Basic
        return ["PASS","AORE","MAIL","RFPR","CLAY","GOOD","ENSP","FMSP","STEL","OIL_",
                "PAPR","FOOD","PETR","PORE","RUBR","SAND","SCMT","VPTS","VEHI","WOOD"];
    case(Economies.FIRS2__TROPIC_BASIC): // Tropic Basic
        return ["PASS","BEER","MAIL","BEAN","RFPR","GOOD","JAVA","COPR","CORE","ENSP",
                "FMSP","FOOD","FISH","FRUT","GRAI","LVST","MNSP","NITR","OIL_","WOOL"];
    case(Economies.FIRS2__IN_A_HOT_COUNTRY): // In a Hot Country
        return ["PASS","BEER","MAIL","BDMT","CASS","GOOD","RFPR","CLAY","JAVA","COPR",
                "CORE","FOOD","DIAM","EOIL","ENSP","FMSP","FRUT","LVST","WDPR","MAIZ",
                "MNO2","MNSP","NUTS","OIL_","PETR","PHOS","RUBR","SAND","GRVL","WOOD"];
    case(Economies.FIRS2__EXTREME): // Extreme
        return ["PASS","BEER","MAIL","AORE","BDMT","GOOD","RFPR","CLAY","COAL","ENSP",
                "FMSP","FOOD","FISH","FRUT","GRAI","IORE","LVST","WDPR","MNSP","STEL",
                "MILK","OIL_","PETR","FICR","RCYC","SAND","SCMT","GRVL","SGBT","WOOD","WOOL"];
    /* YETI 0.1.6 */
    case(Economies.YETI):
    {
        local list = ["PASS","GRVL","MAIL","WOOD","BDMT",  null,"GRAI","FRUT","FOOD",  null,
                      "OIL_",  null,"STEL","PETR","BATT","VEHI","YETI","CLAY","LVST","URAN",
                      "IORE"];
        if (21 < cargo_list.len() && cargo_list[21] == "YETY")
            list.append("YETY");
        return list;
    }
    /* FIRS version 3 */
    case(Economies.FIRS3__TEMPERATE_BASIC): // Temperate Basic
        return ["PASS","BEER","MAIL","RFPR","CLAY","GOOD","COAL","ENSP","FMSP","FISH",
                "FRUT","FOOD","IORE","LVST","MILK","SAND","SCMT","STEL"];
    case(Economies.FIRS3__ARCTIC_BASIC): // Arctic Basic
        return ["PASS","KAOL","MAIL","ENSP","FMSP","GOOD","PAPR","PORE","BEER","WDPR",
                "PHOS","FOOD","BOOM","ZINC","FISH","SULP","FERT","WOOD","PEAT"];
    case(Economies.FIRS3__TROPIC_BASIC): // Tropic Basic
        return ["PASS","BEER","MAIL","BEAN","RFPR","GOOD","JAVA","COPR","CORE","ENSP",
                "FMSP","FOOD","FISH","FRUT","GRAI","LVST","NITR","OIL_","WOOL"];
    case(Economies.FIRS3__STEELTOWN): // Steeltown
        return ["PASS","CMNT","MAIL","QLME","ENSP","VEHI","FMSP","STEL","SLAG","LIME",
                "SAND","FOOD","MNO2","COAL","IORE","IRON","COKE","PETR","SULP","SCMT",
                "SASH","ZINC","COPR","RUBR","PIPE","SALT","ACID","CHLO","POWR","VPTS","VBOD"];
    case(Economies.FIRS3__IN_A_HOT_COUNTRY): // In A Hot Country
        return ["PASS","BEER","MAIL","BDMT","CASS","GOOD","RFPR","CLAY","JAVA","COPR",
                "CORE","FOOD","DIAM","EOIL","ENSP","FMSP","FRUT","LVST","WDPR","MAIZ",
                "MNO2","NUTS","OIL_","PETR","PHOS","RUBR","SAND","GRVL","WOOD"];
    case(Economies.FIRS3__EXTREME): // Extreme
        return ["PASS","BEER","MAIL","AORE","BDMT","GOOD","RFPR","CLAY","COAL","ENSP",
                "FMSP","FOOD","FISH","FRUT","GRAI","IORE","LVST","WDPR","MNSP","METL",
                "MILK","OIL_","PETR","FICR","RCYC","SAND","SCMT","GRVL","SGBT","WOOD","WOOL"];
    /* NAIS version 1.0.6 */
    case(Economies.NAIS__NORTH_AMERICA): // North America
        return ["PASS","AORE","MAIL","BDMT","RFPR","GOOD","CLAY","COAL","CORE","FMSP",
                "FICR","FOOD","FISH","PETR","GLAS","GRAI","IORE","LVST","WDPR","ENSP","METL",
                "MILK","PORE","OIL_","PAPR","FRUT","SAND","SCMT","GRVL","URAN","VALU","WOOD"];
    /* Improved Town Industries 1.6 */
    case(Economies.ITI):
    {
        local list = ["PASS","COAL","MAIL","OIL_","WDPR","GOOD","RFPR","WOOD","IORE","STEL",
                        null,  null,"FOOD",  null,  null,  null];

        list[10] = ((10 < cargo_list.len() && cargo_list[10] == "RCYC") ? "RCYC" : null);
        list[11] = ((11 < cargo_list.len() && cargo_list[11] == "WSTE") ? "WSTE" : null);
        list[13] = ((13 < cargo_list.len() && cargo_list[13] == "URAN") ? "URAN" : null);
        list[14] = ((14 < cargo_list.len() && cargo_list[14] == "NUKF") ? "NUKF" : null);
        list[15] = ((15 < cargo_list.len() && cargo_list[15] == "NUKW") ? "NUKW" : null);

        // Remove null cargo types at the end of the list
        local index = 15;
        while (list[index] == null) {
            list.remove(index);
            --index;
        }

        return list;
    }
    /* FIRS version 4.3 */
    case(Economies.FIRS4__TEMPERATE_BASIC): // Temperate Basic
        return ["PASS","BEER","MAIL","RFPR","COAL","GOOD","ENSP","FMSP","FISH","FRUT",
                "IORE","FOOD","KAOL","LVST","MILK","SAND","SCMT","STEL"];
    case(Economies.FIRS4__ARCTIC_BASIC): // Arctic Basic
        return ["PASS","NH3_","MAIL","ENSP","BOOM","FMSP","FERT","FISH","KAOL","WOOD",
                "WDPR","FOOD","PAPR","PEAT","PHOS","POTA","PORE","SULP","ZINC"];
    case(Economies.FIRS4__TROPIC_BASIC): // Tropic Basic
        return ["PASS","BEER","MAIL","BEAN","RFPR","GOOD","JAVA","COPR","CORE","ENSP",
                "FMSP","FOOD","FISH","FRUT","GRAI","LVST","NITR","OIL_","WOOL"];
    case(Economies.FIRS4__STEELTOWN): // Steeltown
        return ["PASS","ACID","MAIL","STAL","ALUM","VEHI","CBLK","STCB","CSTI","CMNT",
                "CHLO","FOOD","SOAP","COAL","CTAR","COKE","POWR","ENSP","FMSP","FECR",
                "GLAS","IORE","LIME","LYE_","MNO2","O2__","COAT","IRON","PIPE","PLAS",
                "QLME","RUBR","SALT","SAND","SCMT","SLAG","SASH","STST","STSE","STSH",
                "STWR","SULP","TYRE","VBOD","VENG","VPTS","ZINC","POTA"];
    case(Economies.FIRS4__IN_A_HOT_COUNTRY): // In A Hot Country
        return ["PASS","BEER","MAIL","BDMT","CASS","GOOD","RFPR","CLAY","JAVA","COPR",
                "CORE","FOOD","DIAM","EOIL","ENSP","FMSP","FRUT","LVST","WOOD","WDPR",
                "MAIZ","MNO2","NUTS","OIL_","PETR","PHOS","RUBR","SAND","GRVL"];

    /* FIRS version 5.2.0 */
    /* Note: These lists determine the PRIORITY for dynamic assignment later */
	case(Economies.FIRS5__STEELTOWN): // Manual Fix: Updated to match FIRS 5.x log (added STPL, STSW, PLNT)
        return ["PASS","MAIL","FOOD","GOOD","SAND","COAL","IORE","LIME","SALT","SCMT",
                "ENSP","FMSP","PLNT","POWR","ACID","ALUM","CBLK","CSTI","CMNT","CHLO","SOAP",
                "CTAR","COKE","CCPR","FEAL","FOCA","GLAS","HWAR","LYE_","N7__","O2__",
                "COAT","IRON","POTA","PPWK","PUMP","QLME","RBAR","RUBR","SEAL","SLAG",
                "SASH","STBL","STIG","STBR","STPP","STPL","STSH","STSL","STTB","STWR","STSW",
                "SULP","TYCO","TYRE","VEHI","VBOD","VENG","VPTS","WELD","ZINC","GRVL"];

	case(Economies.FIRS5__TEMPERATE_BASIC): // Fixed: CHEM instead of RFPR. Sorted for RVG Priority.
        return ["PASS","MAIL","FOOD","GOOD","BEER","MILK","FRUT","FISH","LVST",
                "COAL","IORE","STEL","SAND","SCMT","ENSP","FMSP","CHEM","KAOL"];
               
	case(Economies.FIRS5__ARCTIC_BASIC): // Fixed: Matches user log (19 cargos). Removed GOOD, BEER, CHEM.
       return ["PASS","MAIL","FOOD","FISH","WOOD","WDPR","PAPR","PEAT","KAOL",
               "PHOS","POTA","SULP","ZINC","NH3_","FERT","BOOM","PORE","ENSP","FMSP"];
               
    case(Economies.FIRS5__TROPIC_BASIC): // Fixed: CHEM instead of RFPR. Sorted for RVG Priority.
        return ["PASS","MAIL","FOOD","GOOD","BEER","FRUT","FISH","LVST","BEAN","GRAI","JAVA","WOOL",
                "NITR","OIL_","CHEM","COPR","CORE","ENSP","FMSP","RUBR"];                
                
	case(Economies.FIRS5__IN_A_HOT_COUNTRY): //Swapped RFPR for CHEM to match FIRS 5.x log
        return ["PASS","MAIL","FOOD","GOOD","BEER","CASS","FRUT","JAVA","MAIZ","NUTS",
                "LVST","WOOD","WDPR","CHEM","CLAY","COPR","CORE","DIAM","EOIL","ENSP",
                "FMSP","MNO2","OIL_","PETR","PHOS","RUBR","SAND","BDMT","GRVL"];                
                
    case(Economies.XIS__THE_LOT): // XIS 0.6: The Lot
        return ["PASS","ACID","MAIL","BEER","AORE","GOOD","BEAN","BDMT","CMNT","RFPR",
                "CHLO","FOOD","CLAY","COAL","COKE","COPR","CORE","EOIL","POWR","ENSP",
                "BOOM","FMSP","FERT","FISH","FRUT","GRAI","IORE","KAOL","LIME","LVST",
                "WDPR","MNO2","METL","MILK","NITR","OIL_","MNSP","PAPR","PEAT","PETR",
                "PHOS","IRON","PIPE","FICR","PORE","QLME","RCYC","RUBR","SALT","SAND",
                "SCMT","SLAG","SASH","STEL","SGBT","SULP","VBOD","VPTS","VEHI","WOOD",
                "WOOL","ZINC"];
    case (Economies.AXIS__STEELTOWN): //AXIS 2.2.0 Steel City
        return ["PASS","ACID","MAIL","STAL","ALO_","GOOD","ALUM","NH3_","NHNO","AORE",
                "CBLK","FOOD","STCB","CMNT","RFPR","CHLO","SOAP","COAL","CTAR","COKE",
                "COPR","COCO","POWR","ENSP","C2H4","FMSP","FECR","FISH","FRUT","GLAS",
                "GRAI", "H2__", "IORE", "LIME", "LVST", "LYE_", "N7__", "OIL_", "O2__", "MNSP",
                "COAT","PETR","IRON","PLAS","PPAR","PORE","QLME","RCYC","RUBR","SALT",
                "SAND","SCMT","SLAG","SASH","STSE","STSH","STWR","SULP","TYRE","VBOD",
                "VENG", "VPTS", "VEHI", "ZINC"];
                
    case (Economies.AXIS__TROPICAL_PARADISE): // AXIS 2.2.0 Tropical Paradise
        return ["PASS","ACET","MAIL","BEER","BIOM","GOOD","BDMT","RFPR","CLAY","SOAP",
                "COAL","FOOD","COKE","COPR","COCO","CORE","EOIL","ENSP","BOOM","FMSP",
                "FERT","FISH","BAKE","ENUM","FRUT","GLAS","GRAI","IORE","LIME","LVST",
                "WOOD","MEAT","MILK","NITR","OIL_","OLSD","MNSP","COAT","PETR","PHOS",
                "PHAC","IRON","FICR","PLAS","QLME","RAMT","RCYC","RUBR","SALT","SAND",
                "SCMT","SLAG","SASH","STEL","STSE","SGCN","SUGR","SULP","SUAC","TEXT",
                "WDPR","TYRE","VPTS","VEHI"];
    case(Economies.OTIS): // OTIS 05
        local list = ["PASS","COAL","MAIL","OIL_","LIME","GOOD","GRAI","WOOD","IORE","STEL",
                      "MILK","FOOD","PAPR","FISH","WOOL","CLAY","SAND","WDPR","PCL_","GRVL",
                      "FRUT","BDMT","BEER","MAIZ","CMNT","GLAS","LVST","PETR","FRVG","FICR",
                      "OTI1","CORE","SCMT","COPR","URAN","VALU","AORE","OTI2","NKOR","SULP",
                      "RUBR","VEHI","BAKE","PIPE","OYST","MEAT","CHSE","FURN","TEXT","SEED",
                      "FERT","BOOM","ACID","CHLO","SLAG","TWOD","SESP","FUEL","ELTR","WATR",
                      "TATO","POWR","MPTS","RFPR"];
        if (60 < cargo_list.len() && cargo_list[60] == "POTA")
            list[60] = "POTA";
        if (38 < cargo_list.len() && cargo_list[38] == "NICK")
            list[38] = "NICK";
        if (29 < cargo_list.len() && cargo_list[29] == "SASH")
            list[29] = "SASH";
        return list;

    case(Economies.IOTC): // IOTC 0.1.4
        return ["PASS","TOUR","MAIL","JAVA","OILD","BEER","SGCN","SUGR","TBCO", null,
                "MOLS","CIGR","FOOD","OILI","FUEL","RFPR","PIPE","NKOR","NICK","COBL",
                "FERT","ENSP"];
    case(Economies.LUMBERJACK): // Lumberjack Industries
        return ["PASS","COAL","MAIL","OIL_","RFPR","GOOD","GRAI","WOOD","WDPR","PAPR",
                "MNSP","FERT","FOOD","KAOL","FUEL","COAT"]
    case(Economies.WRBI): // WRBI 1200
        local list = ["PASS","COAL","MAIL","OIL_","LVST","GOOD","GRAI","WOOD","IORE","STEL",
                      "VALU","FOOD",  null,  null,  null,  null,  null,  null,  null,  null,
                        null,"GRVL","BDMT",  null,  null,"PLST","WDPR","RFPR","BEER","PETR"];
        if (23 < cargo_list.len() && cargo_list[23] == "RCYC")
            list[23] = "RCYC";
        if (30 < cargo_list.len() && cargo_list[30] == "WSTE")
            list.append("WSTE");
        return list;
    case(Economies.ITI2): // Improved Town Industries 2.14
        return ["PASS","COAL","MAIL","OIL_","WDPR","GOOD","RFPR","WOOD","IORE","STEL","PAPR",
                "PLAS","FOOD","BDMT","VALU","LVST","WDCH","SCMT","SCPR","GRAI","WSTE"];

    case(Economies.REAL): // Real Industries Beta
        return ["PASS","COAL","GOOD","GRAI","IORE","MAIL","LVST","OIL_","STEL","VALU",
                "WOOD","MAIZ","WDPR","WORK","STUD","OTI2","TRSH","VEHI","PRIS","FOOD",
                "PASS","PETR","RUBR","PLAS","TYRE","HVEH"];

    case(Economies.MINIMALIST): // Minimalist Industries
        return ["PASS", null,"MAIL", null, null,"GOOD"];

    case(Economies.PIRS): // PIRS 2022
        return ["PASS","COAL","MAIL","OIL_","FISH","GOOD","GRAI","WOOD","IORE","STEL","WDPR",
                "FOOD","FRUT","ENSP","FMSP","RFPR","PETR"];
	case(Economies.GIST): // GIST 0.19.1 - 2025
    return ["PASS","COAL","MAIL","OIL_","LVST","GOOD","GRAI","WOOD","IORE","STEL",
            "FISH","FOOD","PLAS","WDPR","VEHI","LIME","SAND","CMNT","BDMT","WOOL",
            "TEXT","ALUM","AORE","SALT","CHLO","LYE_","H2__","CORE","COPR","CBLK",
            "COAT","MILK","MNSP","QLME","GLAS","PAPR","RFPR","C2H4","PETR","COKE",
            "PORE","SULP","ACID","O2__","N2__","NH3_","SASH","FRUT","BIOM","ENSP",
            "STSH","STWR","SCMT","RCYC","RUBR","ZINC","TYRE","VENG","VBOD","VPTS"];
    default:
        return [];
    }
}

function ConstructECSVectorCargoList(cargo_list) {
    local return_list = [];
    for (local i = 0; i < 64; ++i) {
        return_list.append(null);
    }

    // ECS Town
    local town = true;
    local town_list = ["PASS","MAIL","GOOD","GOLD","WATR","TOUR"];
    local town_idx = [0,2,5,10,27,31];
    foreach (index, id in town_idx) {
        if (town_idx[index] >= cargo_list.len() || cargo_list[id] != town_list[index]) {
            town = false;
            break;
        }
    }
    if (town) {
        Log.Info("ECS Town Vector 1.2 present.", Log.LVL_DEBUG);
        foreach (index, id in town_idx) {
            return_list[id] = town_list[index];
        }
    } else { // Add landscape specific cargos if town vector is not present
        local default_list = [];
        switch (GSGame.GetLandscape()) {
            case GSGame.LT_TEMPERATE:
                default_list = GetEconomyCargoList(Economies.BASESET__TEMPERATE, cargo_list);
                break;
            case GSGame.LT_ARCTIC:
                default_list = GetEconomyCargoList(Economies.BASESET__ARCTIC, cargo_list);
                break;
            case GSGame.LT_TROPIC:
                default_list = GetEconomyCargoList(Economies.BASESET__TROPICAL, cargo_list);
                break;
            case GSGame.LT_TOYLAND:
                default_list = GetEconomyCargoList(Economies.BASESET__TOYLAND, cargo_list);
                break;
        }
        foreach (index, cargo in default_list) {
            return_list[index] = cargo;
        }
    }

    // ECS Basic
    local basic = true;
    local basic_list = ["COAL","SAND","GLAS","BDMT"];
    local basic_idx = [1,17,18,28];
    foreach (index, id in basic_idx) {
        if (basic_idx[index] >= cargo_list.len() || cargo_list[id] != basic_list[index]) {
            basic = false;
            break;
        }
    }
    if (basic) {
        Log.Info("ECS Basic Vector 1.2 present.", Log.LVL_DEBUG);
        foreach (index, id in basic_idx) {
            return_list[id] = basic_list[index];
        }
    }

    // ECS Chemical
    local chemical = true;
    local chemical_list = ["OIL_","DYES","RFPR","PETR"];
    local chemical_idx = [3,20,23,25];
    foreach (index, id in chemical_idx) {
        if (chemical_idx[index] >= cargo_list.len() || cargo_list[id] != chemical_list[index]) {
            chemical = false;
            break;
        }
    }
    if (chemical) {
        Log.Info("ECS Chemical Vector 1.2 present.", Log.LVL_DEBUG);
        foreach (index, id in chemical_idx) {
            return_list[id] = chemical_list[index];
        }
    }

    // ECS Machinery
    local machinery = true;
    local machinery_list = ["IORE","STEL","VEHI","AORE"];
    local machinery_idx = [8,9,24,26];
    foreach (index, id in machinery_idx) {
        if (machinery_idx[index] >= cargo_list.len() || cargo_list[id] != machinery_list[index]) {
            machinery = false;
            break;
        }
    }
    if (machinery) {
        Log.Info("ECS Machinery Vector 1.2 present.", Log.LVL_DEBUG);
        foreach (index, id in machinery_idx) {
            return_list[id] = machinery_list[index];
        }
    }

    // ECS Wood
    local wood = true;
    local wood_list = ["WOOD","PAPR","WDPR"];
    local wood_idx = [7,12,19];
    foreach (index, id in wood_idx) {
        if (wood_idx[index] >= cargo_list.len() || cargo_list[id] != wood_list[index]) {
            wood = false;
            break;
        }
    }
    if (wood) {
        Log.Info("ECS Wood Vector 1.2 present.", Log.LVL_DEBUG);
        foreach (index, id in wood_idx) {
            return_list[id] = wood_list[index];
        }
    }

    // ECS Agricultural
    local agricultural = true;
    local agricultural_list = ["LVST","CERE","FOOD","FRUT","FISH","WOOL","FERT","OLSD","FICR"];
    local agricultural_idx = [4,6,11,13,14,15,21,22,29];
    foreach (index, id in agricultural_idx) {
        if (agricultural_idx[index] >= cargo_list.len() || cargo_list[id] != agricultural_list[index]) {
            agricultural = false;
            break;
        }
    }
    if (agricultural) {
        Log.Info("ECS Agricultural Vector 1.2 present.", Log.LVL_DEBUG);
        foreach (index, id in agricultural_idx) {
            return_list[id] = agricultural_list[index];
        }
    }

    // Remove null cargo types at the end of the list
    local index = 63;
    while (return_list[index] == null) {
        return_list.remove(index);
        --index;
    }

    return return_list;
}

::CargoSettings <- {
    [Economies.BASESET__TEMPERATE] = { // Base temperate
        limiter = [0,2],
        cat = [[0,2],
               [1,3,4,6,7,8],
               [5,9,10]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PRODUCTS],
        pop = [0,1000,4000],
        perm = [60,45,25],
        decay = [0.4,0.2,0.1]
    },
    [Economies.BASESET__ARCTIC] = { // Base arctic
        limiter = [0,2],
        cat = [[0,2],
               [1,3,4,6,7,10],
               [5,9,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PRODUCTS],
        pop = [0,1000,4000],
        perm = [60,45,25],
        decay = [0.4,0.2,0.1]
    },
    [Economies.BASESET__TROPICAL] = { // Base tropical
        limiter = [0,2],
        cat = [[0,2],
               [1,3,4,6,7,8,9,10],
               [5,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PRODUCTS],
        pop = [0,1000,4000],
        perm = [60,45,25],
        decay = [0.4,0.2,0.1]
    },
    [Economies.BASESET__TOYLAND] = { // Base toyland
        limiter = [0,2],
        cat = [[0,2],
               [1,4,6,7,8,9,10],
               [3,5,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PRODUCTS],
        pop = [0,1000,4000],
        perm = [60,45,25],
        decay = [0.4,0.2,0.1]
    },
    [Economies.FIRS1__FIRS_ECONOMY] = { // FIRS 1.4 - Firs Economy
        limiter = [0,2],
        cat = [[0,2],
               [4,6,10,12,13,14],
               [1,3,7,8,15,16,17,20,22,26,27,31],
               [9,18,19,21,23,24],
               [5,11,25,28,29]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS1__TEMPERATE_BASIC] = { // FIRS 1.4 - Temperate Basic
        limiter = [0,2],
        cat = [[0,2],
               [4,10,13],
               [1,8,16,17,19],
               [9,18,20,23,24],
               [5,11,29]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS1__ARCTIC_BASIC] = { // FIRS 1.4 - Arctic Basic
        limiter = [0,2],
        cat = [[0,2],
               [4,6,14],
               [3,7,8,16],
               [13,18,21,23,24],
               [5,11,25,29]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS1__TROPIC_BASIC] = { // FIRS 1.4 - Tropic Basic
        limiter = [0,2],
        cat = [[0,2],
               [4,6,10,12,13],
               [3,15,17,27],
               [18,21,23,24],
               [5,11,19]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS1__HEARTH_OF_DARKNESS] = { // FIRS 1.4 - Hearth of the Darkness
        limiter = [0,2],
        cat = [[0,2],
               [6,10,12,13,14],
               [1,3,7,8,22,27],
               [18,20,21,24],
               [5,11,28,29]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.ECS] = { // ECS 1.2
        limiter = [0,2],
        cat = [[0,2,31],
               [4,6,13,14,22,27],
               [1,3,7,8,10,15,17,26,29],
               [9,12,18,19,20,21,23],
               [5,11,24,25,28]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS2__TEMPERATE_BASIC] = { // FIRS 2 - Temperate Basic
        limiter = [0,2],
        cat = [[0,2],
               [9,10,13,16],
               [4,6,12,17,18],
               [3,7,8,14,15],
               [1,5,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS2__ARCTIC_BASIC] = { // FIRS 2 - Arctic Basic
        limiter = [0,2],
        cat = [[0,2],
               [11],
               [1,4,9,13,14,15,16,19],
               [3,6,7,8,10,12,17],
               [5,18]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS2__TROPIC_BASIC] = { // FIRS 2 - Tropic Basic
        limiter = [0,2],
        cat = [[0,2],
               [1,3,6,12,13,14,15],
               [8,17,18,19],
               [4,9,10,16],
               [5,7,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS2__IN_A_HOT_COUNTRY] = { // FIRS 2 - In a Hot Country
        limiter = [0,2],
        cat = [[0,2],
               [4,8,16,17,19,22],
               [7,10,12,20,23,25,26,27,28,29],
               [6,13,14,15,18,21,24],
               [1,3,5,9,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS2__EXTREME] = { // FIRS 2 - Extreme
        limiter = [0,2],
        cat = [[0,2],
               [12,13,14,16,20,28],
               [3,7,8,15,21,23,24,25,26,27,29,30],
               [6,9,10,17,18,19],
               [1,4,5,11,22]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.YETI] = { // YETI 0.1.6
        limiter = [0,2],
        cat = [[0,2,16,21],
               [6,7,18],
               [1,3,10,17,19,20],
               [12,13,14],
               [4,8,15]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS3__TEMPERATE_BASIC] = { // FIRS 3 - Temperate Basic
        limiter = [0,2],
        cat = [[0,2],
               [9,10,13,14],
               [4,6,12,15,16],
               [3,7,8,17],
               [1,5,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS3__ARCTIC_BASIC] = { // FIRS 3 - Arctic Basic
        limiter = [0,2],
        cat = [[0,2],
               [8,11,14],
               [1,7,10,17,18],
               [3,4,9,13,15],
               [5,6,12,16]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS3__TROPIC_BASIC] = { // FIRS 3 - Tropic Basic
        limiter = [0,2],
        cat = [[0,2],
               [1,3,6,12,13,14,15],
               [8,16,17,18],
               [4,9,10],
               [5,7,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS3__STEELTOWN] = { // FIRS 3 - Steeltown
        limiter = [0,2],
        cat = [[0,2],
               [9,10,11,13,14,19,25],
               [12,17,21,22,23],
               [3,4,6,7,8,15,16,18,26],
               [1,5,24,27,28,29,30]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.LOCAL_PRODUCTION,CatLabels.IMPORTED_GOODS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS3__IN_A_HOT_COUNTRY] = { // FIRS 3 and 4.0-4.1 - In A Hot Coutry
        limiter = [0,2],
        cat = [[0,2],
               [4,8,16,17,19,21],
               [7,10,12,20,22,24,25,26,27,28],
               [6,13,14,15,18,23],
               [1,3,5,9,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS3__EXTREME] = { // FIRS 3 - Extreme
        limiter = [0,2],
        cat = [[0,2],
               [12,13,14,16,20,28],
               [3,7,8,15,21,23,24,25,26,27,29,30],
               [6,9,10,17,18,19],
               [1,4,5,11,22]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.NAIS__NORTH_AMERICA] = { // NAIS 1.0.6 - North America
        limiter = [0,2],
        cat = [[0,2],
               [10,12,15,17,21,25],
               [1,6,7,8,16,22,23,26,27,28,29,30,31],
               [4,9,13,14,18,20,24],
               [3,5,11,19]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.ITI] = { // Improved Town Industries 1.6
        limiter = [0,2,11],
        cat = [[0,2,11],
               [1,3,7,8,12,13],
               [4,5,6,9,10,14,15]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PRODUCTS],
        pop = [0,1000,4000],
        perm = [60,45,25],
        decay = [0.4,0.2,0.1]
    },
    [Economies.FIRS4__TEMPERATE_BASIC] = { // FIRS 4.3: Temperate Basic
        limiter = [0,2],
        cat = [[0,2],
               [8,9,13,14],
               [4,10,12,15,16],
               [3,6,7,17],
               [1,5,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS4__ARCTIC_BASIC] = { // FIRS 4.3: Arctic Basic
        limiter = [0,2],
        cat = [[0,2],
               [1,7,11,15],
               [8,9,13,14,16],
               [3,5,10,17],
               [4,6,12,18]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS4__TROPIC_BASIC] = { // FIRS 4.3: Tropic Basic
        limiter = [0,2],
        cat = [[0,2],
               [1,3,6,12,13,14,15],
               [8,16,17,18],
               [4,9,10],
               [5,7,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS4__STEELTOWN] = { // FIRS 4.3: Steeltown
        limiter = [0,2],
        cat = [[0,2],
               [11,13,21,22,25,32,33,34,36,47],
               [4,12,16,19,24,26,29,31,46],
               [3,6,7,8,17,20,27,37,39,40],
               [5,9,28,38,42,43,44,45]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.LOCAL_PRODUCTION,CatLabels.IMPORTED_GOODS,
                CatLabels.MANUFACTORING_COMPS,CatLabels.FINAL_AND_VEHICLES],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1],
        cat_6 = {
            items = [1,10,14,15,18,23,30,35,41],
            insert_idx = 3,
            label = CatLabels.REFINED_MATS,
            pop_active = [0, 500, 1000, 4000, 8000, 12000],
            perm_active = [60, 20, 20, 15, 15, 10],
            decay_active = [0.4, 0.2, 0.2, 0.15, 0.15, 0.1]
        }
    },
    [Economies.FIRS4__IN_A_HOT_COUNTRY] = { // FIRS 4.3 -In A Hot Coutry
        limiter = [0,2],
        cat = [[0,2],
               [4,8,16,17,20,22],
               [7,10,12,18,21,23,25,26,27,28],
               [6,13,14,15,19,24],
               [1,3,5,9,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS5__TEMPERATE_BASIC] = { // FIRS 5 - Temperate Basic
    limiter = [14,12],
    cat = [[14,12],                    // Public Services: PASS, MAIL
           [5,6,11,13],                // Raw Food: FISH,FRUT,LVST,MILK
           [2,8,10,15],                // Raw Materials: COAL,IORE,KAOL,SAND
           [0,1,16,17],                // Processed: BEER,CHEM,SCMT,STEL
           [3,4,7,9]],                 // Final: ENSP,FMSP,GOOD,FOOD
    list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
            CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
    pop = [0,500,1000,4000,8000],
    perm = [60,25,25,20,15],
    decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS5__ARCTIC_BASIC] = { // FIRS 5 - Arctic Basic
    limiter = [11,9],
    cat = [[11,9],              // Public Services: PASS, MAIL
           [5,8,12,14],         // Raw Food/Nature: FISH,WOOD,PEAT,POTA
           [7,13,15,18],        // Raw Industrial: KAOL,PHOS,PORE,ZINC
           [0,2,4,16,17],       // Processed: NH3_,BOOM,FERT,SULP,WDPR
           [1,3,6,10]],         // Final: ENSP,FMSP,FOOD,PAPR
    list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
            CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
    pop = [0,500,1000,4000,8000],
    perm = [60,25,25,20,15],
    decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS5__TROPIC_BASIC] = { // FIRS 5 - Tropic Basic
    limiter = [17,14],
    cat = [[17,14],             // Public Services: PASS, MAIL
           [1,8,10,12,13,18],   // Raw Food: BEAN,FISH,FRUT,GRAI,LVST,WOOL
           [5,16],              // Raw Industrial: CORE,OIL_
           [0,2,3,4,15],        // Processed: BEER,CHEM,JAVA,COPR,NITR
           [6,7,9,11]],         // Final: ENSP,FMSP,FOOD,GOOD
    list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
            CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
    pop = [0,500,1000,4000,8000],
    perm = [60,25,25,15,10],
    decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.FIRS5__STEELTOWN] = { // FIRS 5.2 - Steeltown
        limiter = [28,24],
        cat = [[28,24],//public services
               [1,9,6,21,22,25,26,30,37,38,39,42,60],//local production - 1
               [2,8,13,14,16,27,36,61],//imported goods - 1
               [3,5,55,59],//manufactoring components - 3
               [45,56]],//finished goods and vehicles - 4
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.LOCAL_PRODUCTION,CatLabels.IMPORTED_GOODS,
                CatLabels.MANUFACTORING_COMPS,CatLabels.FINAL_AND_VEHICLES],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1],
        cat_6 = {
            items = [0,3,4,7,10,11,12,15,17,18,19,20,23,29,31,32,33,34,35,40,41,43,44,46,47,48,49,50,51,52,53,54,57,58],//refined components - 2
            insert_idx = 3,
            label = CatLabels.REFINED_MATS,
            pop_active = [0, 500, 1000, 4000, 8000, 12000],
            perm_active = [60, 20, 20, 15, 15, 10],
            decay_active = [0.4, 0.2, 0.2, 0.15, 0.15, 0.1]
        }
    },
	[Economies.FIRS5__IN_A_HOT_COUNTRY] = { // FIRS 5 - In A Hot Country
    limiter = [23,18],
    cat = [[23,18],                              // Public Services: PASS, MAIL
           [3,5,8,9,14,16,17,19,20,21,22,25,26,27], // Raw/Food: CASS,CLAY,CORE,DIAM,FRUT,LVST,WOOD,MAIZ,MNO2,NUTS,OIL_,PHOS,RUBR,SAND
           [0,1,7,10,24,28],                     // Processed: GRVL,BEER,COPR,EOIL,PETR,WDPR
           [2,4,13],                             // Manufactured: BDMT,CHEM,FOOD
           [11,12,15]],                          // Final: ENSP,FMSP,GOOD
    list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
            CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
    pop = [0,500,1000,4000,8000],
    perm = [60,25,25,15,10],
    decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.XIS__THE_LOT] = { // XIS 0.6: The Lot
        limiter = [0,2],
        cat = [[0,2],
               [6,11,23,24,25,29,33,38,54],
               [4,12,13,16,26,27,28,31,34,35,40,43,44,46,47,48,49,50,52,59,60],
               [1,8,9,10,14,15,19,20,21,22,30,32,37,41,45,51,53,55,61],
               [3,5,7,17,18,36,39,42,56,57,58]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_FOOD,CatLabels.RAW_MATERIALS,
                CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1]
    },
    [Economies.AXIS__STEELTOWN] = { // AXIS 2.2.0: Steel City
        limiter = [0,2],
        cat = [[0,2],
                [9, 17, 18, 32, 33, 36, 37, 38, 45, 47, 50, 51, 52, 53], //raw
                [1, 4, 10, 14, 15, 19, 21, 24, 26, 31, 35, 41, 42, 46, 57, 63], //processed
                [3, 6, 7, 8, 12, 13, 20, 29, 39, 43, 48, 55, 56], //intermediate
                [5, 16, 22, 23, 25, 40, 44, 54, 58, 59, 60, 61, 62] //complex
        ],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_AND_FOOD,CatLabels.REFINED_MATS,
                CatLabels.MANUFACTORING_COMPS, CatLabels.FINAL_AND_VEHICLES ],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1],
        cat_6 = {
            items = [11, 27, 28, 30, 34, 49],
            insert_idx = 1,
            label = CatLabels.RAW_FOOD,
            rename_idx = 1,
            rename_label = CatLabels.RAW_MATERIALS,
            pop_active = [0, 500, 1000, 4000, 8000, 12000],
            perm_active = [60, 20, 20, 15, 15, 10],
            decay_active = [0.4, 0.2, 0.2, 0.15, 0.15, 0.1]
        }
    },
    [Economies.AXIS__TROPICAL_PARADISE] = { // AXIS 2.2.0: Tropical Paradise
        limiter = [0,2],
        cat = [[0,2],
                [8, 10, 15, 27, 28, 30, 33, 34, 35, 39, 42, 46, 47, 48, 49, 50], // "Raw materials"
                [1, 4, 7, 38, 57, 12, 14, 16, 25, 60, 40, 41, 44, 51, 52, 58, 59], // "Refined materials"
                [13, 9, 18, 20, 36, 37, 43, 45, 53, 54, 61, 62], // "Manufacturing components"
                [5, 6, 17, 19, 63] // "Finished goods and vehicles"
        ],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_AND_FOOD,CatLabels.REFINED_MATS,
                CatLabels.MANUFACTORING_COMPS, CatLabels.FINAL_AND_VEHICLES ],
        pop = [0,500,1000,4000,8000],
        perm = [60,25,25,15,10],
        decay = [0.4,0.2,0.2,0.1,0.1],
        cat_6 = {
            items = [3, 11, 21, 22, 23, 24, 26, 29, 31, 32, 55, 56],
            insert_idx = 1,
            label = CatLabels.RAW_FOOD,
            rename_idx = 1,
            rename_label = CatLabels.RAW_MATERIALS,
            pop_active = [0, 500, 1000, 4000, 8000, 12000],
            perm_active = [60, 20, 20, 15, 15, 10],
            decay_active = [0.4, 0.2, 0.2, 0.15, 0.15, 0.1]
        }
    },
    [Economies.OTIS] = { // OTIS 03
        limiter = [0,2],
        cat = [[0,2],
               [1,4,6,7,8,9,10,11,13,14,15,16,17,19,20,23,26,28,29,30,31,32,40,44,49,51,55,59,60,63],
               [3,5,12,22,24,25,27,33,36,38,39,42,43,45,46,48,50,52,53,54,56],
               [18,21,34,35,37,41,47,57,58,61,62]],
        list = [CatLabels.CATEGORY_I,CatLabels.CATEGORY_II,CatLabels.CATEGORY_III,
                CatLabels.CATEGORY_IV],
        pop = [0,500,1000,4000],
        perm = [60,25,25,15],
        decay = [0.4,0.2,0.2,0.1]
    },
    [Economies.IOTC] = { // IOTC 0.1.2
        limiter = [0,2],
        cat = [[0,2],
               [6,8,12,13,15],
               [10,14,16,17],
               [4,5,20,21]],
        list = [CatLabels.CATEGORY_I,CatLabels.CATEGORY_II,CatLabels.CATEGORY_III,
                CatLabels.CATEGORY_IV],
        pop = [0,500,1500,4000],
        perm = [60,35,25,15],
        decay = [0.4,0.3,0.2,0.1]
    },
    [Economies.LUMBERJACK] = { // Lumberjack Industries 0.1.0
        limiter = [2],
        cat = [[2],
               [12],
               [5],
               [1]],
        list = [CatLabels.CATEGORY_I,CatLabels.CATEGORY_II,CatLabels.CATEGORY_III,
                CatLabels.CATEGORY_IV],
        pop = [500,1500,3000,6000],
        perm = [25,25,25,25],
        decay = [0.3,0.3,0.3,0.3]
    },
    [Economies.WRBI] = { // WRBI 1200
        limiter = [0,2],
        cat = [[0,2],
               [1,3,4,6,7,8,21,23],
               [9,25,26,27,30],
               [5,10,11,22,28,29]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1500,4000],
        perm = [60,35,25,15],
        decay = [0.4,0.3,0.2,0.1]
    },
    [Economies.ITI2] = { // Improved Town Industries 2
        limiter = [0,2,20],
        cat = [[0],
               [12],
               [13],
               [5],
               [14]],
        list = [CatLabels.CATEGORY_I,CatLabels.CATEGORY_II,CatLabels.CATEGORY_III,
                CatLabels.CATEGORY_IV,CatLabels.CATEGORY_V],
        pop = [0,1000,2000,3000,4000],
        perm = [60,45,35,25,15],
        decay = [0.5,0.4,0.3,0.2,0.1]
    },
    [Economies.REAL] = { // Real Industries Beta
        limiter = [0,2,5],
        cat = [[0,2,5],
               [1,3,4,6,7,9,10,11,16],
               [8,12,22,23,24],
               [13,14,15,18,20],
               [17,19,21,25]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PRODUCTS,
                CatLabels.PUBLIC_SERVICES,CatLabels.FINAL_PRODUCTS],
        pop = [0,1000,2000,3000,4000],
        perm = [60,45,35,15,15],
        decay = [0.5,0.4,0.3,0.1,0.1]
    },
    [Economies.MINIMALIST] = { // Minimalist Industries 1.1
        limiter = [0,2],
        cat = [[0,2],
               [5]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.PRODUCTS],
        pop = [0,500],
        perm = [60,45],
        decay = [0.4,0.4]
    },
    [Economies.PIRS] = { // PIRS 2022
        limiter = [0,2],
        cat = [[0,2],
               [1,3,4,6,7,8,12],
               [9,10,13,14,15,16],
               [5,11]],
        list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_MATERIALS,CatLabels.PROCESSED_MATERIALS,CatLabels.FINAL_PRODUCTS],
        pop = [0,500,1500,4000],
        perm = [60,35,25,15],
        decay = [0.4,0.3,0.2,0.1]
    },
	[Economies.GIST] = { // GIST 0.19.1 - 2025
    limiter = [0,2],
    cat = [[0,2],                                          // Public Services: PASS, MAIL
           [1,3,4,6,7,8,10,19,22,27,31,40,47,48],         // Raw/Food: COAL,OIL_,LVST,GRAI,WOOD,IORE,FISH,WOOL,AORE,CORE,MILK,PORE,FRUT,BIOM
           [9,13,15,16,23,25,26,28,33,35,36,38,39,41,46,52,54,55], // Processed: STEL,WDPR,LIME,SAND,SALT,LYE_,H2__,COPR,QLME,PAPR,RFPR,PETR,COKE,SULP,SASH,SCMT,RUBR,ZINC
           [17,18,20,21,24,29,30,32,34,37,43,44,45,50,51,53], // Manufactured: CMNT,BDMT,TEXT,ALUM,CHLO,CBLK,COAT,MNSP,GLAS,C2H4,O2__,N2__,NH3_,STSH,STWR,RCYC
           [5,11,12,49]],                                  // Final/Vehicles: GOOD,FOOD,PLAS,ENSP
    list = [CatLabels.PUBLIC_SERVICES,CatLabels.RAW_AND_FOOD,CatLabels.REFINED_MATS,
            CatLabels.MANUFACTORING_COMPS,CatLabels.FINAL_AND_VEHICLES],
    pop = [0,500,1000,4000,8000],
    perm = [60,25,25,15,10],
    decay = [0.4,0.2,0.2,0.1,0.1],
    cat_6 = {
        items = [14,56,57,58,59],                          // Vehicles: VEHI,TYRE,VENG,VBOD,VPTS
        insert_idx = 5,
        label = CatLabels.FINAL_AND_VEHICLES,
        pop_active = [0,500,1000,4000,8000,12000],
        perm_active = [60,20,20,15,15,10],
        decay_active = [0.4,0.2,0.2,0.15,0.15,0.1]
    }
	},
};

/* HELPER: Finds the real Cargo ID for a given String Label (e.g. "PASS") */
function GetCargoIDByLabel(label)
{
    foreach (id, l in ::CargoIDList) {
        if (l == label) return id;
    }
    return null;
}


/* HELPER: Takes the sorted String List from GetEconomyCargoList and builds real ID categories */
function DefineDynamicCargos(economy)
{
    // 1. Get Settings
    // Check if the user enabled "Use 6 categories" in the script settings
    local allow_6_cats = (::SettingsTable.rawin("cargo_6_category") && ::SettingsTable.cargo_6_category);

    // 2. Get Cargos (Sorted Labels -> Real IDs)
    local sorted_labels = GetEconomyCargoList(economy, null);
    local real_ids = [];
    foreach (label in sorted_labels) {
        local id = GetCargoIDByLabel(label);
        if (id != null) real_ids.append(id);
    }
    
    // 3. Initialize Global Tables
    ::CargoCat <- [];
    ::CargoCatList <- [];
    ::CargoMinPopDemand <- [];
    ::CargoPermille <- [];
    ::CargoDecay <- [];

    // Helper to add a category easily
    local AddCat = function(ids, label, pop, perm, dec) {
		
		for (local i = 0; i < ids.len(); i++) {
			Log.Info("#"+i+" Cargo Id: " + ids[i] + " Label: "+ label, Log.LVL_INFO);
		
		}
        ::CargoCat.append(ids);
        ::CargoCatList.append(label);
        ::CargoMinPopDemand.append(pop);
        ::CargoPermille.append(perm);
        ::CargoDecay.append(dec);
    };
    
    // --- Category 1: Public Services (Always Top 2) ---
    // Usually PASS and MAIL
    local cat1_slice = real_ids.slice(0, 2);
    AddCat(cat1_slice, CatLabels.PUBLIC_SERVICES, 0, 60, 0.4);
    ::CargoLimiter <- cat1_slice; // Town growth strictly depends on this

    // --- Dynamic Slicing for Industry ---
    local rest = real_ids.slice(2);
    local count = rest.len();
    local slices = [];
    local num_ind_cats = 1; // Default to 1 big pile

    // Calculate how many buckets we need based on density
    if (count <= 8) {
        // Tiny Economy: 1 generic bucket
        num_ind_cats = 1; 
    } 
    else if (count <= 16) {
        // Basic Economy (Temp/Arctic ~16 items): 2 buckets (Raw, Final)
        num_ind_cats = 2; 
    } 
    else if (count <= 24) {
        // Medium Economy: 3 buckets
        num_ind_cats = 3; 
    } 
    else if (count <= 36) {
        // Large Economy (Hot Country ~28 items): 4 buckets
        // Total = 1 (Pass) + 4 (Ind) = 5 Categories
        num_ind_cats = 4; 
    } 
    else {
        // Huge Economy (Steeltown ~58 items): 5 buckets
        // Total = 1 (Pass) + 5 (Ind) = 6 Categories
        // Only if setting allows, otherwise cap at 4 industrial buckets
        num_ind_cats = allow_6_cats ? 5 : 4; 
    }

    // Slice the 'rest' array into equal-ish chunks
    local chunk_size = ((count.tofloat()) / num_ind_cats).tointeger();
    if (count % num_ind_cats != 0) chunk_size++; // Round up

    local current_idx = 0;
    for (local i = 0; i < num_ind_cats; i++) {
        local end_idx = current_idx + chunk_size;
        
        // Safety: Clamp end index
        if (end_idx > count) end_idx = count;
        // Logic: If this is the last bucket, force it to take ALL remaining items
        if (i == num_ind_cats - 1) end_idx = count;

        if (current_idx < count) {
            slices.append(rest.slice(current_idx, end_idx));
        }
        current_idx = end_idx;
    }

    // --- Map Slices to Properties ---
    // FIX: Used '=' instead of ':' for table properties (Squirrel syntax)
    local defs = [
        { l = CatLabels.RAW_FOOD,          pop = 500,  perm = 25, dec = 0.2 },
        { l = CatLabels.RAW_MATERIALS,     pop = 1000, perm = 25, dec = 0.2 },
        { l = CatLabels.PROCESSED_MATERIALS, pop = 2000, perm = 15, dec = 0.1 },
        { l = CatLabels.FINAL_PRODUCTS,    pop = 4000, perm = 15, dec = 0.1 },
        { l = CatLabels.CATEGORY_V,        pop = 8000, perm = 10, dec = 0.05 } 
    ];

    foreach (i, slice in slices) {
        if (i < defs.len()) {
            local d = defs[i];
            AddCat(slice, d.l, d.pop, d.perm, d.dec);
        } else {
            // Fallback if we somehow exceed our definitions
             AddCat(slice, CatLabels.CATEGORY_V, 8000 + (i*2000), 10, 0.05);
        }
    }
    
    return true;
}

function DefineCargosBySettings(economy)
{
    /* Setup global cargo variables for legacy economies */
    // Lookup settings
    if (!(economy in ::CargoSettings)) {
        if (!CreateDefaultCargoCat())
            return false;
    } else {
        local s = ::CargoSettings[economy];
		
        if (!_IsLimiterValid(s))
            return DefineDynamicCargos(economy);
        
        ::CargoLimiter <- s.limiter;
        ::CargoCat <- s.cat;
        ::CargoCatList <- s.list;
        ::CargoMinPopDemand <- s.pop;
        ::CargoPermille <- s.perm;
        ::CargoDecay <- s.decay;

        if ("cat_6" in s) {
            local c6 = s.cat_6;
            if (::SettingsTable.cargo_6_category) {
                if ("rename_idx" in c6) {
                    ::CargoCatList[c6.rename_idx] = c6.rename_label;
                }
                ::CargoCat.insert(c6.insert_idx, c6.items);
                ::CargoCatList.insert(c6.insert_idx, c6.label);
                ::CargoMinPopDemand <- c6.pop_active;
                ::CargoPermille <- c6.perm_active;
                ::CargoDecay <- c6.decay_active;
            } else {
                ::CargoCat[c6.insert_idx].extend(c6.items);
            }
        }
    }

    // Remove unused cargo ids
    _PruneUnusedCargoIds();
    _SlotOrphanedCargos();
    
    return true;
}

function _IsLimiterValid(s)
{
    if (s.limiter.len() < 2) return true;

    local label_0 = (s.limiter[0] < ::CargoIDList.len()) ? ::CargoIDList[s.limiter[0]] : null;
    local label_1 = (s.limiter[1] < ::CargoIDList.len()) ? ::CargoIDList[s.limiter[1]] : null;

    if (label_0 != "PASS" || label_1 != "MAIL") {
        Log.Info("_IsLimiterValid: Failed for economy (expected PASS/MAIL, got "
                 + label_0 + "/" + label_1 + "). Will fall back to dynamic.", Log.LVL_INFO);
        return false;
    }

    return true;
}

function _PruneUnusedCargoIds()
{
    if (!::CargoIDList) return;

    foreach (cat in ::CargoCat) {
        for (local index = 0; index < cat.len(); ++index) {
            if (cat[index] >= ::CargoIDList.len() || ::CargoIDList[cat[index]] == null) {
Log.Info("Cargo-remove unused cargo", Log.LVL_INFO);
                cat.remove(index);
                --index;
            }
        }
    }

    foreach (index, cargo in ::CargoLimiter) {
        if (cargo >= ::CargoIDList.len() || ::CargoIDList[cargo] == null) {
Log.Info("Cargo-remove unused cargolimiter", Log.LVL_INFO);
            ::CargoLimiter.remove(index);
            --index;
        }
    }
}

function _SlotOrphanedCargos()
{
Log.Info("Cargo-slot orphaned cargos in", Log.LVL_INFO);
    // Build a set of all cargo IDs already assigned to a category
    local assigned = {};
    foreach (cat in ::CargoCat) {
        foreach (cargo in cat) {
            assigned[cargo] <- true;
        }
    }

    // Find live cargos that exist but weren't assigned anywhere
    local orphans = [];
    foreach (index, label in ::CargoIDList) {
        if (label == null) continue;
        if (label == "PASS" || label == "MAIL") continue;
        if (!(index in assigned)) {
            orphans.append(index);
            Log.Info("_SlotOrphanedCargos: Unassigned cargo " + label 
                     + " (ID " + index + ") will be slotted dynamically.", Log.LVL_INFO);
        }
    }

    if (orphans.len() == 0) return;

    // Slot each orphan into the category whose min pop demand
    // best fits it, using raw/processed as a rough guide
    foreach (cargo in orphans) {
        local is_raw = IsRawCargo(cargo);
        local best_cat = 1; // Default to second category (first non-public)

        for (local i = 1; i < ::CargoCat.len(); i++) {
            if (is_raw && ::CargoMinPopDemand[i] <= 1000) {
                best_cat = i;
                break;
            } else if (!is_raw && ::CargoMinPopDemand[i] >= 1000) {
                best_cat = i;
                break;
            }
        }

        Log.Info("_SlotOrphanedCargos: Slotting " + ::CargoIDList[cargo] 
                 + " into category " + best_cat 
                 + " (pop " + ::CargoMinPopDemand[best_cat] + ")", Log.LVL_INFO);
        ::CargoCat[best_cat].append(cargo);
    }
}



/* Compare the ingame initial cargo list to the
 * industry sets and cargoscheme supported by the script.
 */

function DiscoverEconomyType()
{
    local best_economy = Economies.NONE;
    local best_score = 0.0;
    
    // Get the actual game cargos once
    local actual_list = ::CargoIDList; 

    // Loop through ALL defined economies to find the best statistical match
    for (local i = 1; i < Economies.END; ++i) {
        local expected = GetEconomyCargoList(i, actual_list);
        if (expected == null || expected.len() == 0) continue;

        local score = _CargoMatchScore(expected, actual_list);
        
		//  if scores are equal, the higher ID (Newer Economy) wins.
        // This ensures FIRS 5 beats FIRS 4 if their cargo lists are identical.
        if (score >= best_score) {
            best_score = score;
            best_economy = i;
        }
    }
    
    // Logging for verification
    if (best_economy != Economies.NONE) {
        Log.Info("Economy Detection Winner: " + EconomyName(best_economy) + " (ID " + best_economy + ")", Log.LVL_INFO);
        Log.Info("Match Confidence: " + (best_score * 100) + "%", Log.LVL_INFO);
    } else {
        Log.Info("Economy Detection: No match found. Falling back to GENERATED.", Log.LVL_INFO);
    }
    _LogMissingCargos(GetEconomyCargoList(best_economy, actual_list), actual_list);
    return best_economy;
}

function _LogMissingCargos(expected_list, actual_list)
{
    local actual_set = {};
    foreach (label in _NormalizeCargoLabelList(actual_list)) {
        actual_set[label] <- true;
    }

    foreach (label in _NormalizeCargoLabelList(expected_list)) {
        if (!(label in actual_set)) {
            Log.Info("_LogMissingCargos: " + label 
                     + " is in economy definition but not in live game.", Log.LVL_INFO);
        }
    }
}

/* Removes nulls and special internal labels so we can sort safely.
 * This prevents crashes when comparing lists with gaps.
 */
function _NormalizeCargoLabelList(list)
{
    local out = [];
    foreach (item in list) {
        if (item == null) continue;       // Skip empty slots
        if (item == "LVPT") continue;     // Skip internal special labels if present
        out.append(item);
    }
    return out;
}

/* Debug function to log the Economy name*/
function EconomyName(e)
{
switch(e) {
        case Economies.FIRS5__IN_A_HOT_COUNTRY: return "FIRS5 IN_A_HOT_COUNTRY";
        case Economies.FIRS5__STEELTOWN: return "FIRS5 STEELTOWN";
        case Economies.FIRS5__TEMPERATE_BASIC: return "FIRS5 TEMPERATE";
        case Economies.FIRS5__ARCTIC_BASIC: return "FIRS5 ARCTIC";
        case Economies.FIRS5__TROPIC_BASIC: return "FIRS5 TROPIC";
        case Economies.FIRS4__TEMPERATE_BASIC: return "FIRS4 TEMPERATE";
        case Economies.MINIMALIST: return "MINIMALIST";
		case Economies.GIST: return "GIST 0.19.1";
        
        default: return "NOT RECORDED(" + e + ")";
    }
}

/**
 * Calculates Jaccard Similarity (Intersection over Union).
 * Returns 0.0 to 1.0.
 * Handles inputs as Sets to prevent duplicate weighting.
 */
function _CargoMatchScore(expected_list, actual_list)
{
    // 1. Normalize (remove nulls) and Deduplicate (convert to sets)
    local set_a = {};
    foreach (x in _NormalizeCargoLabelList(expected_list)) set_a[x] <- true;
    
    local set_b = {};
    foreach (x in _NormalizeCargoLabelList(actual_list)) set_b[x] <- true;

    if (set_a.len() == 0 || set_b.len() == 0) return 0.0;

    // 2. Count Intersection
    local inter = 0;
    foreach (x, _ in set_a) {
        if (set_b.rawin(x)) inter++;
    }

    // 3. Calculate Union
    local uni = set_a.len() + set_b.len() - inter;
    if (uni <= 0) return 0.0;

    return inter.tofloat() / uni.tofloat();
}

/* COMPARISON: Normalizes, Sorts, and checks for equality. */
function CompareCargoLists(expected_list, actual_list)
{
    local expected = _NormalizeCargoLabelList(expected_list);
    local actual   = _NormalizeCargoLabelList(actual_list);

    if (expected.len() == 0) return false;

    local actual_set = {};
    foreach (label in actual) actual_set[label] <- true;

    foreach (label in expected) {
        if (!(label in actual_set)) return false;
    }
    return true;
}


function SortCategoriesMinPopDemand()
{
    for (local i = 0; i < ::CargoCatNum; i++) {
        for (local j = 0; j < ::CargoCatNum - 1; j++) {
            if (::CargoMinPopDemand[j] > ::CargoMinPopDemand[j+1]) {
                local cargo_cat = ::CargoCat[j];
                ::CargoCat[j] = ::CargoCat[j+1];
                ::CargoCat[j+1] = cargo_cat;

                local cargo_cat_list = ::CargoCatList[j];
                ::CargoCatList[j] = ::CargoCatList[j+1];
                ::CargoCatList[j+1] = cargo_cat_list;

                local min_pop_demand = ::CargoMinPopDemand[j];
                ::CargoMinPopDemand[j] = ::CargoMinPopDemand[j+1];
                ::CargoMinPopDemand[j+1] = min_pop_demand;

                local cargo_permille = ::CargoPermille[j];
                ::CargoPermille[j] = ::CargoPermille[j+1];
                ::CargoPermille[j+1] = cargo_permille;

                local cargo_decay = ::CargoDecay[j];
                ::CargoDecay[j] = ::CargoDecay[j+1];
                ::CargoDecay[j+1] = cargo_decay;
            }
        }
    }
}

function InitCurrentCargoList()
{
    ::CargoIDList <- [];
    for(local i = 0; i < 64; ++i) {
        local label = GSCargo.GetCargoLabel(i);
        if (label == "LVPT") // CZTR ZBARVENI
            ::CargoIDList.append(null);
        else if (label == null) {
            local has_cargo_after = false;
            for (local j = i + 1; j < 64; ++j) {
                if (GSCargo.GetCargoLabel(j) != null) {
                    has_cargo_after = true;
                    break;
                }
            }

            if (!has_cargo_after)
                break;
            ::CargoIDList.append(GSCargo.GetCargoLabel(i));
        }
        else
            ::CargoIDList.append(label);
    }
}

/* Initialization of cargo data. */
function InitCargoLists()
{
    InitCurrentCargoList(); // Get current cargo list from the game
    local cur = _NormalizeCargoLabelList(::CargoIDList);
    Log.Info("Current cargos (" + cur.len() + "): " + JoinStrings(cur, ","), Log.LVL_INFO);
    

    DebugCargoLabels();         // Debug info: print cargo labels

    // Get economy type based on cargo list
    // Define cargo data accordingly to industry set
    local economy = DiscoverEconomyType();
    if (!DefineCargosBySettings(economy))
        return false;
    Log.Info("Economy: " + (economy == Economies.NONE ? "generated" : ("predefined " + economy)), Log.LVL_INFO);
    Log.Info("Economy resolved: " + EconomyName(economy) + " (" + economy + ")", Log.LVL_INFO);
    
    // Initializing some useful and often used variables
    ::CargoCatNum <- ::CargoCat.len();
    ::Economy <- economy;

    // Change cargo min pop demand if specified
    local changed_min_pop_demand = false;
    for (local i = 0; i < ::CargoCatNum; i++) {
        if (::SettingsTable.category_min_pop[i] >= 0) {
            ::CargoMinPopDemand[i] = ::SettingsTable.category_min_pop[i];
            changed_min_pop_demand = true;
        }
    }

    if (changed_min_pop_demand)
        SortCategoriesMinPopDemand();

    return true;
}

/* Randomize fixed number of cargos per category and return cargo table. */
function RandomizeFixed(number, near_cargos, near_cargo_probability)
{
    local cargo_cat_text = "";
    local cargo_cat = array(::CargoCat.len());
    foreach (cat_idx, cat in ::CargoCat)
    {
        cargo_cat_text += cat_idx + ": [";

        if (::CargoCatList[cat_idx] == CatLabels.PUBLIC_SERVICES || ::CargoCatList[cat_idx] == CatLabels.CATEGORY_I) {
            cargo_cat[cat_idx] = cat;

            foreach (cargo in cat) {
                cargo_cat_text += GSCargo.GetCargoLabel(cargo) + " ";
            }
        } else {
            local cargo_list = clone cat;
            local near_cargo_list = clone near_cargos[cat_idx];
            cargo_cat[cat_idx] = [];
            for (local i = 0; i < number && cargo_list.len() != 0; i++) {
                if (near_cargo_list.len() && GSBase.Chance(near_cargo_probability, 100)) { // Use near cargo
                    local index = GSBase.RandRange(near_cargo_list.len());
                    cargo_cat[cat_idx].append(near_cargo_list[index]);

                    // Find and remove cargo index from the other array
                    foreach (idx, cargo in cargo_list) {
                        if (cargo == near_cargo_list[index]) {
                            cargo_list.remove(idx);
                            break;
                        }
                    }

                    cargo_cat_text += GSCargo.GetCargoLabel(near_cargo_list[index]) + "(NEAR) ";
                    near_cargo_list.remove(index);
                }
                else { // Use any cargo
                    local index = GSBase.RandRange(cargo_list.len());
                    cargo_cat[cat_idx].append(cargo_list[index]);

                    // Find and remove cargo index from the other array
                    foreach (idx, cargo in near_cargo_list) {
                        if (cargo == cargo_list[index]) {
                            near_cargo_list.remove(idx);
                            break;
                        }
                    }

                    cargo_cat_text += GSCargo.GetCargoLabel(cargo_list[index]) + "(RAND) ";
                    cargo_list.remove(index);
                }
            }
        }

        cargo_cat_text += "] ";
    }

    //Log.Info(GSTown.GetName(this.id) + ": " + cargo_cat_text, Log.LVL_SUB_DECISIONS);

    return cargo_cat;
}

/* Randomize number of cargos per category specified by range and return cargo table. */
function RandomizeRange(lower, upper, near_cargos, near_cargo_probability)
{
    local cargo_cat_text = "";
    local cargo_cat = array(::CargoCat.len());
    foreach (cat_idx, cat in ::CargoCat)
    {
        cargo_cat_text += cat_idx + ": [";

        if (::CargoCatList[cat_idx] == CatLabels.PUBLIC_SERVICES || ::CargoCatList[cat_idx] == CatLabels.CATEGORY_I) {
            cargo_cat[cat_idx] = cat;

            foreach (cargo in cat) {
                cargo_cat_text += GSCargo.GetCargoLabel(cargo) + " ";
            }
        } else {
            local cargo_list = clone cat;
            local near_cargo_list = clone near_cargos[cat_idx];
            cargo_cat[cat_idx] = [];
            for (local i = 0; i < upper && cargo_list.len() != 0; i++) {
                if (cargo_cat[cat_idx].len() >= lower && GSBase.Chance(1, 2)) // 50% chance to
                    break;

                if (near_cargo_list.len() && GSBase.Chance(near_cargo_probability, 100)) { // Use near cargo
                    local index = GSBase.RandRange(near_cargo_list.len());
                    cargo_cat[cat_idx].append(near_cargo_list[index]);

                    // Find and remove cargo index from the other array
                    foreach (idx, cargo in cargo_list) {
                        if (cargo == near_cargo_list[index]) {
                            cargo_list.remove(idx);
                            break;
                        }
                    }

                    cargo_cat_text += GSCargo.GetCargoLabel(near_cargo_list[index]) + "(NEAR) ";
                    near_cargo_list.remove(index);
                }
                else { // Use any cargo
                    local index = GSBase.RandRange(cargo_list.len());
                    cargo_cat[cat_idx].append(cargo_list[index]);

                    // Find and remove cargo index from the other array
                    foreach (idx, cargo in near_cargo_list) {
                        if (cargo == cargo_list[index]) {
                            near_cargo_list.remove(idx);
                            break;
                        }
                    }

                    cargo_cat_text += GSCargo.GetCargoLabel(cargo_list[index]) + "(RAND) ";
                    cargo_list.remove(index);
                }
            }
        }

        cargo_cat_text += "] ";
    }

    //Log.Info(GSTown.GetName(this.id) + ": " + cargo_cat_text, Log.LVL_SUB_DECISIONS);

    return cargo_cat;
}

function RandomizePyramid(ascending, near_cargos, near_cargo_probability)
{
    local cargo_cat_text = "";
    local cargo_cat = array(::CargoCat.len());
    local number = ascending ? 1 : ::CargoCat.len();
    foreach (cat_idx, cat in ::CargoCat)
    {
        cargo_cat_text += cat_idx + ": [";

        if (::CargoCatList[cat_idx] == CatLabels.PUBLIC_SERVICES || ::CargoCatList[cat_idx] == CatLabels.CATEGORY_I) {
            cargo_cat[cat_idx] = cat;

            foreach (cargo in cat) {
                cargo_cat_text += GSCargo.GetCargoLabel(cargo) + " ";
            }
        } else {
            local cargo_list = clone cat;
            local near_cargo_list = clone near_cargos[cat_idx];
            cargo_cat[cat_idx] = [];
            for (local i = 0; i < number && cargo_list.len() != 0; i++) {
                if (near_cargo_list.len() && GSBase.Chance(near_cargo_probability, 100)) { // Use near cargo
                    local index = GSBase.RandRange(near_cargo_list.len());
                    cargo_cat[cat_idx].append(near_cargo_list[index]);

                    // Find and remove cargo index from the other array
                    foreach (idx, cargo in cargo_list) {
                        if (cargo == near_cargo_list[index]) {
                            cargo_list.remove(idx);
                            break;
                        }
                    }

                    cargo_cat_text += GSCargo.GetCargoLabel(near_cargo_list[index]) + "(NEAR) ";
                    near_cargo_list.remove(index);
                }
                else { // Use any cargo
                    local index = GSBase.RandRange(cargo_list.len());
                    cargo_cat[cat_idx].append(cargo_list[index]);

                    // Find and remove cargo index from the other array
                    foreach (idx, cargo in near_cargo_list) {
                        if (cargo == cargo_list[index]) {
                            near_cargo_list.remove(idx);
                            break;
                        }
                    }

                    cargo_cat_text += GSCargo.GetCargoLabel(cargo_list[index]) + "(RAND) ";
                    cargo_list.remove(index);
                }
            }
        }
        ascending ? number++ : number--;

        cargo_cat_text += "] ";
    }

    //Log.Info(GSTown.GetName(this.id) + ": " + cargo_cat_text, Log.LVL_SUB_DECISIONS);

    return cargo_cat;
}

/* Calculate cargo hash from cargo table */
function GetCargoHash(cargo_cat)
{
    local hash = 0;
    foreach (cat in cargo_cat)
    {
        foreach (cargo in cat)
        {
            hash = hash | (1 << cargo);
        }
    }

    return hash;
}

/* Create cargo table from cargo hash */
function GetCargoTable(hash)
{
    local cargo_cat = array(::CargoCatNum);

    foreach (index, cat in ::CargoCat)
    {
        cargo_cat[index] = [];
        foreach (cargo in cat)
        {
            if (hash & (1 << cargo))
            {
                cargo_cat[index].append(cargo);
            }
        }
    }

    return cargo_cat;
}

/* Checks if one of the industry types that produce this cargo is a raw industry */
function IsRawCargo(cargo)
{
    local industry_type_list= GSIndustryTypeList();
    industry_type_list.Valuate(GSIndustryType.IsRawIndustry);
    industry_type_list.KeepValue(1);

    foreach (industry_type, _ in industry_type_list) {
        local cargo_list = GSIndustryType.GetProducedCargo(industry_type);
        foreach (accepted, _ in cargo_list) {
            if (accepted == cargo)
                return 1;
        }
    }

    return 0;
}

/* Hellper function to join strings */
function JoinStrings(arr, sep)
{
    local s = "";
    for (local i = 0; i < arr.len(); i++) {
        if (i > 0) s += sep;
        s += arr[i];
    }
    return s;
}


function CreateDefaultCargoCat()
{
    // --- START OF FIX: Dynamic Cargo Detection ---
    // 1. Try to find standard Town Cargos dynamically
    local pass_id = GetCargoIDByLabel("PASS");
    local mail_id = GetCargoIDByLabel("MAIL");
    
    // 2. Build the Limiter List (what controls town growth)
    local limiter = [];
    if (pass_id != null) limiter.append(pass_id);
    if (mail_id != null) limiter.append(mail_id);

    // 3. EMERGENCY FALLBACK: If PASS/MAIL are totally missing
    // We pick the first valid cargos we can find, rather than hardcoding 0 and 2
    if (limiter.len() == 0) {
        local all_cargos = GSCargoList();
        foreach (cargo, _ in all_cargos) {
            if (limiter.len() >= 2) break;
            limiter.append(cargo); 
        }
        if (limiter.len() > 0) {
            GSLog.Warning("RVG5: Could not find PASS or MAIL. Defaulting fallback to Cargo IDs: " + limiter[0]);
        }
    }

    // 4. Set the Global Tables based on what we found
    ::CargoLimiter <- limiter;
    // Category 1 is just the limiter cargos (usually PASS + MAIL)
    ::CargoCat <- [clone limiter]; 
    
    ::CargoCatList <- [CatLabels.CATEGORY_I];
    ::CargoMinPopDemand <- [0];
    ::CargoPermille <- [60];
    ::CargoDecay <- [0.4];

    // 5. Clean up the main list for the rest of the function
    local cargo_list = GSCargoList();
    // Remove the limiter cargos so they don't appear in "Raw" or "Processed" categories
    foreach (id in limiter) {
        if (cargo_list.HasItem(id)) cargo_list.RemoveItem(id);
    }
    // --- END OF FIX ---

    cargo_list.Valuate(IsRawCargo);
    // RAW CARGOS
    local raw_list = GSList();
    raw_list.AddList(cargo_list);
    raw_list.KeepValue(1);

    Log.Info("Raw industries: " + raw_list.Count(), Log.LVL_INFO);
    if (raw_list.Count() > 10) {
        ::CargoCat.append([]);
        ::CargoCat.append([]);

        ::CargoCatList.append(CatLabels.CATEGORY_II);
        ::CargoCatList.append(CatLabels.CATEGORY_III);
        ::CargoMinPopDemand.append(500);
        ::CargoMinPopDemand.append(1000);
        ::CargoPermille.append(25);
        ::CargoPermille.append(25);
        ::CargoDecay.append(0.2);
        ::CargoDecay.append(0.2);

        local cargo = raw_list.Begin();
        local index = 0;
        while (!raw_list.IsEnd()) {
            ::CargoCat[1 + Modulo(index, 2)].append(cargo);
            cargo = raw_list.Next();
            ++index;
        }
    }
    else {
        ::CargoCat.append([]);
        ::CargoCatList.append(CatLabels.CATEGORY_II);
        ::CargoMinPopDemand.append(1000);
        ::CargoPermille.append(45);
        ::CargoDecay.append(0.2);

        foreach (cargo, _ in raw_list) {
            ::CargoCat[1].append(cargo);
        }
    }

    // PROCESSED CARGOS
    local processed_list = GSList();
    processed_list.AddList(cargo_list);
    processed_list.KeepValue(0);
    if (processed_list.Count() > 10) {
        ::CargoCat.append([]);
        ::CargoCat.append([]);
        if (::CargoCatList.top() == CatLabels.CATEGORY_III) {
            ::CargoCatList.append(CatLabels.CATEGORY_IV);
            ::CargoCatList.append(CatLabels.CATEGORY_V);
        }
        else {
            ::CargoCatList.append(CatLabels.CATEGORY_III);
            ::CargoCatList.append(CatLabels.CATEGORY_IV);
        }
        ::CargoMinPopDemand.append(4000);
        ::CargoMinPopDemand.append(8000);
        ::CargoPermille.append(15);
        ::CargoPermille.append(15);
        ::CargoDecay.append(0.1);
        ::CargoDecay.append(0.1);

        local cargo = processed_list.Begin();
        local index = 0;
        local shift = ::CargoCatList.top() == CatLabels.CATEGORY_V ? 3 : 2;
        while (!processed_list.IsEnd()) {
            ::CargoCat[shift + Modulo(index, 2)].append(cargo);
            cargo = processed_list.Next();
            ++index;
        }
    }
    else {
        ::CargoCat.append([]);
        if (::CargoCatList.top() == CatLabels.CATEGORY_III)
            ::CargoCatList.append(CatLabels.CATEGORY_IV);
        else
            ::CargoCatList.append(CatLabels.CATEGORY_III);
        ::CargoMinPopDemand.append(4000);
        ::CargoPermille.append(15);
        ::CargoDecay.append(0.1);
        local index = ::CargoCatList.top() == CatLabels.CATEGORY_IV ? 3 : 2;
        foreach (cargo, _ in processed_list) {
            ::CargoCat[index].append(cargo);
        }
    }

    local cargo_text = "";
    foreach (index, cat in ::CargoCat) {
        cargo_text += "  " + (index + 1) + ": ";
        foreach (cargo in cat) {
            cargo_text += GSCargo.GetCargoLabel(cargo) + ",";
        }
    }
    Log.Info(cargo_text, Log.LVL_SUB_DECISIONS);
    foreach (cat in ::CargoCat) {
        if (!cat.len())
            return false;
    }

    return true;
}

function GetTownsNearbyCargoPerCategory()
{
    local town_industries = GetNearbyIndustriesToTowns();

    local town_cargo_category = {};
    foreach (town, industry_list in town_industries) {
        // Combine all industry accepting cargos to a single mask value
        local near_cargo_list = 0;
        foreach (industry in industry_list) {
            local cargo_list = GSCargoList_IndustryAccepting(industry);
            foreach (cargo_id, _ in cargo_list) {
                near_cargo_list = near_cargo_list | (1 << cargo_id);
            }
        }

        // Add town cargos to the mask value using cargo acceptance of 10 tiles around center point of the town
        local town_location = GSTown.GetLocation(town);
        if (GSMap.IsValidTile(town_location)) {
            local cargo_list = GSCargoList();
            foreach (cargo_id, _ in cargo_list)
            {
                if (!GSCargo.IsValidCargo(cargo_id))
                    continue;

                if (GSTile.GetCargoAcceptance(town_location, cargo_id, 1, 1, 10) >= 8) { // Values below 8 mean no acceptance; the more the better.
                    near_cargo_list = near_cargo_list | (1 << cargo_id);
                }
            }
        }

        // Compare the mask with cargo categories
        town_cargo_category[town] <- [];
        foreach (cat_idx, cat in ::CargoCat)
        {
            town_cargo_category[town].append([]);
            foreach (cargo in cat)
            {
                if (near_cargo_list & (1 << cargo))
                    town_cargo_category[town][cat_idx].append(cargo)
            }
        }
    }

    // Print results
    DebugNearTownCargos(town_cargo_category);

    return town_cargo_category;
}
