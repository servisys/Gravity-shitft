$ErrorActionPreference = "Stop"

$ProjectRoot = $PSScriptRoot
$SourceHtml = Join-Path $ProjectRoot "index.html"
$BuildDir = Join-Path $ProjectRoot "dist\html5"
$Target = "servisys/gravity-shift:html5"

if (-not (Test-Path $SourceHtml)) {
    throw "index.html non trovato nella cartella del progetto."
}

if (-not (Get-Command butler -ErrorAction SilentlyContinue)) {
    Write-Host "Butler non è installato o non è nel PATH." -ForegroundColor Red
    Write-Host "Installa Butler: https://itch.io/docs/butler/installing.html"
    exit 1
}

Write-Host ""
Write-Host "GRAVITY SHIFT - Pubblicazione itch.io" -ForegroundColor Cyan
Write-Host "Destinazione: $Target"
Write-Host "Sorgente:     $SourceHtml"
Write-Host ""

# Prepara una cartella pulita: su itch.io index.html deve stare alla radice del build.
if (Test-Path $BuildDir) {
    Remove-Item $BuildDir -Recurse -Force
}
New-Item -ItemType Directory -Path $BuildDir -Force | Out-Null
Copy-Item $SourceHtml (Join-Path $BuildDir "index.html")

# Copia eventuali asset runtime, se in futuro il gioco ne avrà.
$AssetsDir = Join-Path $ProjectRoot "assets"
if (Test-Path $AssetsDir) {
    Copy-Item $AssetsDir $BuildDir -Recurse
}

Write-Host "Build preparata. File inclusi:" -ForegroundColor Green
Get-ChildItem $BuildDir -Recurse -File | ForEach-Object {
    Write-Host ("  " + $_.FullName.Substring($BuildDir.Length + 1))
}

Write-Host ""
$Confirm = Read-Host "Caricare questa versione su itch.io? (S/N)"
if ($Confirm -notin @("S", "s", "SI", "si", "Y", "y", "YES", "yes")) {
    Write-Host "Pubblicazione annullata. Nessun upload eseguito." -ForegroundColor Yellow
    exit 0
}

# Butler usa l'autenticazione locale creata con: butler login
& butler push $BuildDir $Target
if ($LASTEXITCODE -ne 0) {
    throw "Butler ha segnalato un errore durante la pubblicazione (codice $LASTEXITCODE)."
}

Write-Host ""
Write-Host "Pubblicazione completata: https://servisys.itch.io/gravity-shift" -ForegroundColor Green
