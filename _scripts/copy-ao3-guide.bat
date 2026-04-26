@echo off
:: copy-ao3-guide.bat
:: Usage: copy-ao3-guide.bat <target-repo-path>
:: Compatibility shim for copy-ao3-guide.ps1.

setlocal

if "%~1"=="" (
    echo Usage: copy-ao3-guide.bat ^<target-repo-path^>
    echo Example: copy-ao3-guide.bat "C:\Github\my-skin-repo"
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0copy-ao3-guide.ps1" "%~1"
exit /b %ERRORLEVEL%
