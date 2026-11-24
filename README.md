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

## Publish to itch.io
The repository includes a manual GitHub Actions workflow named **Publish to itch.io**. To authorize it without exposing credentials in source code:

1. In the itch.io account settings, generate an API key.
2. In GitHub, open **Settings → Secrets and variables → Actions** and add the repository secret `BUTLER_API_KEY` with that key.
3. Add the repository variable `ITCH_TARGET` with the value `your-itch-username/gravity-shift` (or the exact project slug you create on itch.io).
4. Open **Actions → Publish to itch.io → Run workflow**.

The project must already exist on itch.io and be configured as an HTML game. The workflow uploads the HTML5 build through Butler. Never commit the API key.
