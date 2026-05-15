@echo off
REM bootstrap.bat - Scaffold BA engagement tu ba-skill tren Windows
REM
REM Usage:
REM   bootstrap.bat C:\path\to\engagement [name] [methodology]

setlocal EnableDelayedExpansion

set SCRIPT_DIR=%~dp0

if "%~1"=="" (
  echo Usage: bootstrap.bat ^<engagement-path^> [engagement-name] [methodology]
  echo.
  echo   methodology: undecided ^| srs-only ^| prd-stories ^| stories-only
  echo                default: undecided
  exit /b 1
)

set ENGAGEMENT_PATH=%~1
set ENGAGEMENT_NAME=%~2
set METHODOLOGY=%~3

REM Default name from path basename
if "%ENGAGEMENT_NAME%"=="" (
  for %%i in ("%ENGAGEMENT_PATH%") do set ENGAGEMENT_NAME=%%~nxi
)

REM Default methodology
if "%METHODOLOGY%"=="" set METHODOLOGY=undecided

REM Bootstrap date
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set DT=%%a
set BOOTSTRAP_DATE=%DT:~0,4%-%DT:~4,2%-%DT:~6,2%

REM Agents source: try npx skills first, then claude native, then sibling
set AGENTS_SRC=%USERPROFILE%\.agents\skills\ba-skill\agents
if not exist "%AGENTS_SRC%" set AGENTS_SRC=%USERPROFILE%\.claude\skills\ba-skill\agents
if not exist "%AGENTS_SRC%" set AGENTS_SRC=%SCRIPT_DIR%..\agents

if not exist "%AGENTS_SRC%" (
  echo Cannot find agents/ source. Have you run install.bat?
  echo    Checked:
  echo      %USERPROFILE%\.agents\skills\ba-skill\agents
  echo      %USERPROFILE%\.claude\skills\ba-skill\agents
  echo      %SCRIPT_DIR%..\agents
  exit /b 1
)

echo Bootstrapping engagement...
echo    Target: %ENGAGEMENT_PATH%
echo    Engagement name: %ENGAGEMENT_NAME%
echo    Methodology: %METHODOLOGY%
echo    Bootstrap date: %BOOTSTRAP_DATE%
echo    Agents source: %AGENTS_SRC%
echo.

REM Safety check
if exist "%ENGAGEMENT_PATH%\.project-config.yml" (
  echo Already bootstrapped: %ENGAGEMENT_PATH%
  exit /b 1
)

REM Step 1: project-root
echo [1/3] Copy _project-root\* -^> %ENGAGEMENT_PATH%\
if not exist "%ENGAGEMENT_PATH%" mkdir "%ENGAGEMENT_PATH%"
xcopy /E /I /Q /Y "%SCRIPT_DIR%_project-root\*" "%ENGAGEMENT_PATH%\" >nul

REM Step 2: docs
echo [2/3] Copy docs\* -^> %ENGAGEMENT_PATH%\docs\
if not exist "%ENGAGEMENT_PATH%\docs" mkdir "%ENGAGEMENT_PATH%\docs"
xcopy /E /I /Q /Y "%SCRIPT_DIR%docs\*" "%ENGAGEMENT_PATH%\docs\" >nul

REM Step 3: agents
echo [3/3] Copy agents\*.md -^> %ENGAGEMENT_PATH%\.claude\agents\
if not exist "%ENGAGEMENT_PATH%\.claude\agents" mkdir "%ENGAGEMENT_PATH%\.claude\agents"
xcopy /Q /Y "%AGENTS_SRC%\*.md" "%ENGAGEMENT_PATH%\.claude\agents\" >nul
echo.

REM Substitute placeholders using PowerShell (more reliable than batch sed)
echo Substituting placeholders...
powershell -NoProfile -Command ^
  "Get-ChildItem -Path '%ENGAGEMENT_PATH%' -Recurse -Include '*.md','*.yml','*.yaml' | ForEach-Object { ^
    $content = Get-Content $_.FullName -Raw -Encoding UTF8; ^
    $content = $content -replace '\{ENGAGEMENT_NAME\}','%ENGAGEMENT_NAME%' ^
                       -replace '\{METHODOLOGY\}','%METHODOLOGY%' ^
                       -replace '\{BOOTSTRAP_DATE\}','%BOOTSTRAP_DATE%'; ^
    Set-Content $_.FullName -Value $content -NoNewline -Encoding UTF8 ^
  }"
echo.

echo Bootstrap done.
echo.
echo Engagement structure:
echo    %ENGAGEMENT_PATH%\AGENTS.md
echo    %ENGAGEMENT_PATH%\CLAUDE.md
echo    %ENGAGEMENT_PATH%\.project-config.yml
echo    %ENGAGEMENT_PATH%\.claude\agents\
echo    %ENGAGEMENT_PATH%\docs\
echo.
echo Next steps:
echo    1. cd %ENGAGEMENT_PATH%
echo    2. Open Claude Code in this folder
echo    3. Paste content of docs\prompt\ba\template\00-kickoff.md with your brief

endlocal
