@echo off
REM install.bat - Cai ba-skill global cho Claude Code tren Windows
REM
REM Wraps:
REM   1. npx skills add — register skills → %USERPROFILE%\.agents\skills\
REM   2. xcopy project-template → ca 2 location (.agents + .claude)
REM   3. KHONG copy agents/ — agents di per-engagement qua bootstrap
REM
REM Usage:
REM   install.bat                cai
REM   install.bat /with-cursor   cai cho claude-code + cursor
REM   install.bat /uninstall     go cai
REM   install.bat /dryrun        preview

setlocal EnableDelayedExpansion

set SCRIPT_DIR=%~dp0
set CLAUDE_DIR=%USERPROFILE%\.claude
set CLAUDE_SKILLS_DIR=%CLAUDE_DIR%\skills
set NPX_SKILLS_DIR=%USERPROFILE%\.agents\skills
set TEMPLATE_DIR_NPX=%NPX_SKILLS_DIR%\project-template
set TEMPLATE_DIR_CLAUDE=%CLAUDE_SKILLS_DIR%\project-template

set DRY_RUN=false
set UNINSTALL=false
set WITH_CURSOR=false

for %%a in (%*) do (
  if /I "%%a"=="/uninstall"   set UNINSTALL=true
  if /I "%%a"=="/dryrun"      set DRY_RUN=true
  if /I "%%a"=="/with-cursor" set WITH_CURSOR=true
  if /I "%%a"=="/help"        goto :help
)
goto :main

:help
echo Usage: install.bat [/uninstall^|/dryrun^|/with-cursor]
echo.
echo   /dryrun       preview without applying
echo   /uninstall    remove ba-skill
echo   /with-cursor  also register for cursor
exit /b 0

:main

if "%UNINSTALL%"=="true" (
  echo Uninstalling ba-skill...
  for /D %%d in ("%SCRIPT_DIR%ba-*") do (
    set "name=%%~nxd"
    if "%DRY_RUN%"=="false" (
      rmdir /S /Q "%NPX_SKILLS_DIR%\!name!" 2>nul
      rmdir /S /Q "%CLAUDE_SKILLS_DIR%\!name!" 2>nul
    )
    echo   removed: !name!
  )
  if "%DRY_RUN%"=="false" (
    rmdir /S /Q "%TEMPLATE_DIR_NPX%" 2>nul
    rmdir /S /Q "%TEMPLATE_DIR_CLAUDE%" 2>nul
  )
  echo Uninstalled.
  exit /b 0
)

echo Installing ba-skill global...
echo    Source: %SCRIPT_DIR%
echo    Target (npx): %NPX_SKILLS_DIR%\
echo    Target (claude): %CLAUDE_SKILLS_DIR%\
echo.

REM Step 1: try npx skills add, fallback to xcopy
echo [1/2] Skills (ba-architecture + ba-*) -^> %NPX_SKILLS_DIR%\
set NPX_AGENTS=-a claude-code
if "%WITH_CURSOR%"=="true" set NPX_AGENTS=%NPX_AGENTS% -a cursor

where npx >nul 2>&1
if %ERRORLEVEL% EQU 0 (
  if "%DRY_RUN%"=="false" (
    pushd "%SCRIPT_DIR%"
    call npx skills add . --all %NPX_AGENTS% -g
    popd
  ) else (
    echo    [dry-run] npx skills add . --all %NPX_AGENTS% -g
  )
) else (
  echo    npx not found — fallback to manual xcopy
  if "%DRY_RUN%"=="false" (
    if not exist "%NPX_SKILLS_DIR%" mkdir "%NPX_SKILLS_DIR%"
    if not exist "%CLAUDE_SKILLS_DIR%" mkdir "%CLAUDE_SKILLS_DIR%"
  )
  for /D %%d in ("%SCRIPT_DIR%ba-*") do (
    set "name=%%~nxd"
    if "%DRY_RUN%"=="false" (
      rmdir /S /Q "%NPX_SKILLS_DIR%\!name!" 2>nul
      rmdir /S /Q "%CLAUDE_SKILLS_DIR%\!name!" 2>nul
      xcopy /E /I /Q /Y "%%d" "%NPX_SKILLS_DIR%\!name!\" >nul
      xcopy /E /I /Q /Y "%%d" "%CLAUDE_SKILLS_DIR%\!name!\" >nul
    )
    echo    - !name!
  )
)
echo.

REM Step 2: project template — copy vao CA 2 location
echo [2/2] Project template -^> ca 2 location
if "%DRY_RUN%"=="false" (
  if not exist "%NPX_SKILLS_DIR%" mkdir "%NPX_SKILLS_DIR%"
  if not exist "%CLAUDE_SKILLS_DIR%" mkdir "%CLAUDE_SKILLS_DIR%"
  rmdir /S /Q "%TEMPLATE_DIR_NPX%" 2>nul
  rmdir /S /Q "%TEMPLATE_DIR_CLAUDE%" 2>nul
  xcopy /E /I /Q /Y "%SCRIPT_DIR%project-template" "%TEMPLATE_DIR_NPX%\" >nul
  xcopy /E /I /Q /Y "%SCRIPT_DIR%project-template" "%TEMPLATE_DIR_CLAUDE%\" >nul
)
echo    -^> %TEMPLATE_DIR_NPX%\
echo    -^> %TEMPLATE_DIR_CLAUDE%\
echo.

if "%DRY_RUN%"=="false" (
  echo Installed:
  for /D %%d in ("%NPX_SKILLS_DIR%\ba-*") do echo    - %%~nxd
  echo    - template in %TEMPLATE_DIR_NPX%\
  echo    - template in %TEMPLATE_DIR_CLAUDE%\
  echo.
  echo Next: bootstrap an engagement -^>
  echo    %TEMPLATE_DIR_CLAUDE%\bootstrap.bat C:\path\to\your-engagement
) else (
  echo Dry run complete. Re-run without /dryrun to apply.
)

endlocal
