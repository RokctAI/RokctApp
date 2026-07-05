Write-Host "--- Installing SDKs ---" -ForegroundColor Cyan
python .rokct\sdk_composer.py
if ($LASTEXITCODE -ne 0) { Write-Host "SDK Installation failed" -ForegroundColor Red }

Write-Host "--- Fetching Dependencies ---" -ForegroundColor Cyan
flutter pub get
if ($LASTEXITCODE -ne 0) { Write-Host "Pub get failed" -ForegroundColor Red }

Write-Host "--- Running Code Generation ---" -ForegroundColor Cyan
flutter pub run build_runner build --delete-conflicting-outputs --force-jit
if ($LASTEXITCODE -ne 0) { Write-Host "Build runner failed" -ForegroundColor Red }

Write-Host "--- Analyzing Code ---" -ForegroundColor Cyan
flutter analyze lib/
