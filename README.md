# Municipal Concessions (MC)
### featuring Renewed Village Growth (RVG)

![Renewed Village Growth](https://i.imgur.com/37J9Kn4.png)

MC is a fork of [Renewed Village Growth (RVG)](https://www.tt-forums.net/viewtopic.php?f=65&t=87052) by Firrel — a Game Script for OpenTTD that manages town growth through varied cargo delivery and sustained passenger/mail transportation. This fork builds on community maintenance patches by AlexMD83 and ChronosXYZ, with additional changes and features introduced under the Municipal Concessions name.

The script supports all NewGRF industry replacement sets. RVG itself was born as a combination of [keoz's Renewed City Growth GS](https://www.tt-forums.net/viewtopic.php?f=65&t=69827) and [Sylf's City Growth Limiter GS](https://www.tt-forums.net/viewtopic.php?t=58238).

Forum topic: none yet<br/>
BaNaNaS: none yet

## Lineage

| Version | Author(s) | Notes |
|---|---|---|
| Renewed City Growth GS | keoz | Original inspiration |
| City Growth Limiter GS | Sylf | Original inspiration |
| Renewed Village Growth (RVG) | Firrel | Combined the above; original mod |
| RVG (community patches) | AlexMD83, ChronosXYZ | Maintained after Firrel's silence |
| **Municipal Concessions (MC)** | **Crusoe** | This fork; extended and renamed |

## Requirements

- OpenTTD, v. 15.x or newer.
- GS SuperLib v. 40, ToyLib v. 2, Script Communication for GS v. 45 (you can find it on BaNaNaS, also accessible
  through OTTD's "Online Content").
- Industry sets: you can use any industry NewGRF
    - these are specifically supported industry NewGRF: Baseset (all climates), FIRS 1.4, 2, 3, 4.3, 5.2 (all economies), ECS 1.2 (any combination), YETI 0.1.6
  (all except Simplified), NAIS 1.0.6, ITI 1.6, 2.14, XIS 0.6, AXIS 2.2, OTIS 05, IOTC 0.1, LJI 0.1, WRBI 1200,
  Real Beta, Minimalist, PIRS 2022
    - using RVG with any other unsupported industry set will contain proceduraly generated categories

## Translations
Currently available languages:
- English
- French (rmnvgr, Elarcis)
- Slovak
- Czech
- Simplified Chinese (SuperCirno, WenSimEHRP)
- Polish (qamil95)
- Galician (pvillaverde)
- German (pnkrtz)
- Japanese (fmang)
- Traditional Chinese (WenSimEHRP)
- Russian (Shkarlatov)
- Ukrainian (mortiy)
- Spanish (AI)
- Portuguese (AI)
- Brazilian Portuguese (AI)

If you want to contribute to a translation, you can do it by modifying a file [english.txt](lang/english.txt) and posting it to the forum topic or creating a new issue/pull request with this file included. All instances of `{STRING[number]}` need to be replaced by `{STRING}` in all other languages. Also do not include entries STR_TOWNBOX_CATEGORY_0 through STR_TOWNBOX_COMBINED_5, as they don't have anything to translate.

## License

Municipal Concessions is free software, distributed under the same terms as Renewed Village Growth: the GNU General Public License v2 (see license.txt). Municipal Concessions is a derivative work of RVG by Firrel.

## Credits

**Municipal Concessions** by: Crusoe

**Community patch base** by: AlexMD83, ChronosXYZ

**Renewed Village Growth** by: Firrel

Thanks to:
- keoz for the Renewed City Growth GS
- Sylf for the City Growth Limiter GS
  
Thanks to RVG's original contributors:
- rmnvgr
- pr0saic
- audunmaroey
- SuperCirno
- qamil95
- 2TallTyler
- pvillaverde
- pnkrtz
- fmang
- Elarcis
- lezzano000
- WenSimEHRP
- Shkarlatov
- JGRennison
- bigyihsuan
- rhoun
- skye0e
- mortiy
