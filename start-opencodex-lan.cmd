@echo off
setlocal

cd /d "%~dp0"

set "HOST=0.0.0.0"
set "PORT=3737"
set "CODEX_WEB_PASSWORD=codexdlmm707782628"

if not exist "node_modules" (
  echo Installing dependencies...
  call npm install
  if errorlevel 1 goto :failed
)

if not exist "gateway\dist\server.js" (
  echo Building gateway...
  call npm run build:gateway
  if errorlevel 1 goto :failed
)

echo Starting OpenCodex on http://0.0.0.0:%PORT%/
echo Use this computer's LAN IP from another device, for example http://192.168.x.x:%PORT%/
call npm run web:dev
goto :end

:failed
echo Startup failed.

:end
pause
