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

The current MVP is self-contained in `index.html`, with procedural CSS crystal art, responsive layout, synthesized audio, level parameters and local save data.

## itch.io

Live project: https://servisys.itch.io/gravity-shift

The project is an HTML5 game. The published build must contain `index.html` at its root. The current game has no external runtime files.

## Publish a new version (Windows)

GitHub is the source repository. Publishing is done locally with the official itch.io Butler CLI; GitHub Actions are not required.

1. Install Butler from https://itch.io/docs/butler/installing.html (or use the Butler bundled with the itch app).
2. Open PowerShell in this repository folder.
3. The first time only, run `butler login` and authorize your itch.io account in the browser.
4. For each release, run:

   ```powershell
   .\publish.ps1
   ```

The script stages the HTML5 files in `dist\html5` and uploads them to `servisys/gravity-shift:html5`. Butler keeps its credentials locally; do not put API keys in this repository.

The script asks for confirmation before uploading. It does not run automatically on GitHub and does not consume GitHub Actions minutes.

If you add runtime assets in the future, update the staging section in `publish.ps1` so they are copied into `dist\html5` alongside `index.html`.
