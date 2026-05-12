@echo off
setlocal enabledelayedexpansion

echo ========================================
echo Jupyter Notebook to Markdown Converter
echo ========================================
echo.

:: Change to the script's directory
cd /d "%~dp0"

:: Check if jupyter-nbconvert is available
where jupyter-nbconvert >nul 2>nul
if %errorlevel%==0 (
    set "CMD=jupyter-nbconvert"
    echo Using: jupyter-nbconvert --to markdown
    goto :CONTINUE
)

:: Check if jupyter is available
where jupyter >nul 2>nul
if %errorlevel%==0 (
    set "CMD=jupyter nbconvert"
    echo Using: jupyter nbconvert --to markdown
    goto :CONTINUE
)

:: If neither is found
echo ERROR: Neither jupyter-nbconvert nor jupyter found!
echo.
echo Please install Jupyter with:
echo   pip install jupyter nbconvert
echo.
pause
exit /b 1

:CONTINUE
echo.

:: Create output directory
set "OUTPUT_DIR=markdown_output"
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"
echo Output directory: %OUTPUT_DIR%\
echo.

:: Count notebooks
set TOTAL=0
for %%f in (*.ipynb) do set /a TOTAL+=1

if %TOTAL% equ 0 (
    echo No .ipynb files found in current folder!
    pause
    exit /b 1
)

echo Found %TOTAL% notebook(s) to convert to Markdown
echo.

:: Convert each notebook
set COUNT=0
set SUCCESS=0
set FAIL=0

for %%f in (*.ipynb) do (
    set /a COUNT+=1
    echo [!COUNT!/%TOTAL%] Converting: %%f to Markdown...
    
    %CMD% --to markdown "%%f"
    
    if !errorlevel! equ 0 (
        echo   ✓ Success - Created %%~nf.md
        
        :: Move files to output directory
        if exist "%%~nf.md" (
            move /y "%%~nf.md" "%OUTPUT_DIR%\" >nul
            echo     Moved: %%~nf.md
        )
        
        :: Move any image files that might have been created
        for %%g in ("%%~nf*.png" "%%~nf*.jpg" "%%~nf*.jpeg" "%%~nf*.gif" "%%~nf*.svg") do (
            if exist "%%g" (
                move /y "%%g" "%OUTPUT_DIR%\" >nul
                echo     Moved: %%~nxg
            )
        )
        
        set /a SUCCESS+=1
    ) else (
        echo   ✗ Failed to convert %%f
        set /a FAIL+=1
    )
    echo.
)

echo ========================================
echo Conversion Complete!
echo ========================================
echo Total notebooks: %TOTAL%
echo Successfully converted: %SUCCESS%
echo Failed: %FAIL%
echo.
echo Markdown files saved in: %OUTPUT_DIR%\
echo ========================================

if %FAIL% gtr 0 (
    echo.
    echo Note: %FAIL% conversion(s) failed.
    echo You can try running manually:
    echo   %CMD% --to markdown "your_notebook.ipynb"
)

echo.
pause