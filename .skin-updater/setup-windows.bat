@echo off
if not exist ".git" (
    echo Error: .git folder not found. Run this from your project root.
    pause
    exit /b 1
)

echo Installing AO3 Skin Updater...

mkdir .git\hooks 2>nul
copy .skin-updater\pre-commit .git\hooks\pre-commit >nul

if exist ".git\hooks\pre-commit" (
    echo ✓ Installed
    echo.
    echo Add to your CSS metadata:
    echo   - Updated:      2026-04-18 14:32 UTC
) else (
    echo ✗ Installation failed
    pause
    exit /b 1
)

pause
