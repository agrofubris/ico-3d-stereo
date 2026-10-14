# ICO 3D Stereo

**ICO** (2001) playable on PC in stereoscopic 3D: side-by-side (half and
full), top-and-bottom (half and full), cross-view, interlaced (normal and
reversed), and Leia SR lenticular panels.

## Play in 3 steps (Windows)

1. **Download** `ico-3d-stereo-v0.2.0-win.zip` from
   [Releases](https://github.com/agrofubris/ico-3d-stereo/releases) and
   unzip it anywhere you can write to.
2. **Place your ISO**: you need your own disc image of ICO, PAL version
   (SCES-50760). No game data is included or distributed, ever.
3. **Build and run**: drop the `.iso` onto `setup.bat` (or run
   `setup.bat D:\my.iso`). The game checks the image, builds its data once
   (about 870 MB) and starts. Later runs: double-click `x64\ico_pc_x64.exe`.

Pick your display format in the game: **Settings > Display > 3D mode**.

## Help and development

Docs and development live upstream at
[github.com/nathanialf/ico-pc](https://github.com/nathanialf/ico-pc). For
Linux or the game's regular (non-3D) releases, see the releases there.
This community build is based on ico-pc v0.2.0; upstream's releases are
newer.

## Credits

- Game code: the [ICO decompilation](https://github.com/nathanialf/ico)
  via the MIT-licensed [ico-pc](https://github.com/nathanialf/ico-pc) port.
- Stereo and Leia SR: oneup03's RT64 3D, bo3b's SR-lib, and the Leia work
  of kandowontu2 and agrofubris.
- SR-panel testing: masterotaku.
- Full third-party notices ship in the release zip (`NOTICES.txt`).

Licence: MIT (see [LICENSE](LICENSE)), covering the code only: it grants no
rights in the game or its data. ICO and PlayStation are trademarks of their
owners; this project is not affiliated with Sony Interactive Entertainment
or Team Ico.
