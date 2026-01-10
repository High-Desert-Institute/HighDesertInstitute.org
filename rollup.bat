@echo off
setlocal enabledelayedexpansion

set SCRIPT_DIR=%~dp0
pushd %SCRIPT_DIR% >nul

git submodule update --init --recursive --remote

git diff --quiet && git diff --cached --quiet
if %errorlevel%==0 (
    echo No changes to commit.
    popd >nul
    exit /b 0
)

git add .
git commit -m "Rollup"

popd >nul
endlocal
