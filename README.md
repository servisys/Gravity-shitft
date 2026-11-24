# GRAVITY SHIFT

A self-contained HTML5 cosmic match puzzle. No build step and no runtime dependencies.

## Run locally
Open `index.html` in a modern browser, or serve this folder with any static HTTP server.

## Controls
- Tap/click two adjacent crystals to swap them.
- Match 3+ crystals to score and trigger cascades.
- Matches of 4 or 5 create line / color special crystals.
- From level 4 onward, earn Gravity charge with larger matches and cascades, then use the four directional controls to change the fall direction.
- Progress, stars, best scores and audio preferences are stored in localStorage.

## Project
The MVP is intentionally self-contained in `index.html`, with procedural CSS crystal art, responsive layout, synthesized audio, level parameters and local save data.

## HTML5 / itch.io
For an itch.io HTML5 project, upload a ZIP containing `index.html` at its root and set the project kind to HTML. No external runtime files are required. The Google Fonts import is optional; the game falls back to system fonts when offline.
