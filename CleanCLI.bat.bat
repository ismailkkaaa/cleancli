@echo off
setlocal EnableDelayedExpansion
title ALBAS CLEANER - FINAL
color 0B
mode con: cols=100 lines=38

:: ------------------------------
:: Admin check
:: ------------------------------
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ===============================================================
    echo                ALBAS CLEANER - ADMIN REQUIRED
    echo ===============================================================
    echo.
    echo Please right-click this file and choose:
    echo   Run as Administrator
    echo.
    pause
    exit /b
)

:: ------------------------------
:: Main Menu
:: ------------------------------
:menu
cls
echo ===============================================================
echo                    ALBAS CLEANER - FINAL
echo ===============================================================
echo.
echo Choose what you want to do:
echo.
echo [1] Daily Safe Clean
echo [2] Developer Cache Clean
echo [3] AI / Model Cache Clean
echo [4] App Cache Clean
echo [5] Full Deep Clean
echo [6] Show Free Space
echo [7] Open Storage Settings
echo [8] Open Disk Cleanup
echo [9] Exit
echo.
choice /c 123456789 /n /m "Enter choice (1-9): "

if errorlevel 9 goto end
if errorlevel 8 goto diskcleanup
if errorlevel 7 goto storage
if errorlevel 6 goto freespace
if errorlevel 5 goto fulldeep
if errorlevel 4 goto appclean
if errorlevel 3 goto aiclean
if errorlevel 2 goto devclean
if errorlevel 1 goto safeclean

:: ------------------------------
:: 1) Daily Safe Clean
:: ------------------------------
:safeclean
cls
echo ===============================================================
echo                    DAILY SAFE CLEAN
echo ===============================================================
echo.
echo Cleaning safe junk files...
echo.

call :clean_temp
call :clean_windows_update
call :clean_recycle
call :clean_thumbnails

echo.
echo Daily Safe Clean completed.
pause
goto menu

:: ------------------------------
:: 2) Developer Cache Clean
:: ------------------------------
:devclean
cls
echo ===============================================================
echo                  DEVELOPER CACHE CLEAN
echo ===============================================================
echo.
echo Cleaning developer caches...
echo.

call :clean_pip
call :clean_npm
call :clean_gradle

echo.
echo Developer Cache Clean completed.
pause
goto menu

:: ------------------------------
:: 3) AI / Model Cache Clean
:: ------------------------------
:aiclean
cls
echo ===============================================================
echo                   AI / MODEL CACHE CLEAN
echo ===============================================================
echo.
echo Cleaning AI / model caches...
echo.

call :clean_huggingface
call :clean_ollama
call :clean_insightface

echo.
echo AI / Model Cache Clean completed.
pause
goto menu

:: ------------------------------
:: 4) App Cache Clean
:: ------------------------------
:appclean
cls
echo ===============================================================
echo                     APP CACHE CLEAN
echo ===============================================================
echo.
echo Cleaning app caches...
echo.

call :clean_discord
call :clean_capcut
call :clean_roblox

echo.
echo App Cache Clean completed.
pause
goto menu

:: ------------------------------
:: 5) Full Deep Clean
:: ------------------------------
:fulldeep
cls
echo ===============================================================
echo                     FULL DEEP CLEAN
echo ===============================================================
echo.
echo This cleans safe junk + dev caches + AI caches + app caches.
echo Personal files, projects, Downloads, Desktop files are NOT touched.
echo.
choice /c YN /n /m "Continue? (Y/N): "
if errorlevel 2 goto menu

echo.
echo Running Full Deep Clean...
echo.

call :clean_temp
call :clean_windows_update
call :clean_recycle
call :clean_thumbnails
call :clean_pip
call :clean_npm
call :clean_gradle
call :clean_huggingface
call :clean_ollama
call :clean_insightface
call :clean_discord
call :clean_capcut
call :clean_roblox

echo.
echo ===============================================================
echo                  FULL DEEP CLEAN COMPLETED
echo ===============================================================
echo.
echo Optional:
echo [A] Turn OFF Hibernate (can free 4GB-20GB)
echo [B] Back to Menu
echo.
choice /c AB /n /m "Choose option (A/B): "
if errorlevel 2 goto menu
if errorlevel 1 goto hibernate

:: ------------------------------
:: 6) Free Space
:: ------------------------------
:freespace
cls
echo ===============================================================
echo                      FREE SPACE REPORT
echo ===============================================================
echo.
wmic logicaldisk where "DeviceID='C:'" get DeviceID,FreeSpace,Size
echo.
echo (FreeSpace and Size are shown in bytes)
echo.
pause
goto menu

:: ------------------------------
:: 7) Storage Settings
:: ------------------------------
:storage
start ms-settings:storagesense
goto menu

:: ------------------------------
:: 8) Disk Cleanup
:: ------------------------------
:diskcleanup
cleanmgr
goto menu

:: ------------------------------
:: Hibernate Off
:: ------------------------------
:hibernate
powercfg -h off
echo.
echo Hibernate has been turned OFF.
echo.
pause
goto menu

:: ==============================================================
:: CLEANING FUNCTIONS
:: ==============================================================

:clean_temp
echo [TEMP] Cleaning user temp...
del /q /f /s "%TEMP%\*" >nul 2>&1

echo [TEMP] Cleaning local temp...
del /q /f /s "%LOCALAPPDATA%\Temp\*" >nul 2>&1

echo [TEMP] Cleaning Windows temp...
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1

echo [TEMP] Cleaning crash dumps...
del /q /f /s "%LOCALAPPDATA%\CrashDumps\*" >nul 2>&1
goto :eof

:clean_windows_update
echo [WINDOWS] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /q /f /s "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
goto :eof

:clean_recycle
echo [RECYCLE] Emptying Recycle Bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1
goto :eof

:clean_thumbnails
echo [THUMBNAILS] Cleaning thumbnail cache...
del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*" >nul 2>&1
goto :eof

:clean_pip
echo [PYTHON] Cleaning pip cache...
pip cache purge >nul 2>&1
rmdir /s /q "%LOCALAPPDATA%\pip\Cache" >nul 2>&1
goto :eof

:clean_npm
echo [NODE] Cleaning npm cache...
npm cache clean --force >nul 2>&1
rmdir /s /q "%LOCALAPPDATA%\npm-cache" >nul 2>&1
goto :eof

:clean_gradle
echo [GRADLE] Cleaning Gradle cache...
rmdir /s /q "%USERPROFILE%\.gradle\caches" >nul 2>&1
goto :eof

:clean_huggingface
echo [AI] Cleaning HuggingFace cache...
rmdir /s /q "%USERPROFILE%\.cache\huggingface" >nul 2>&1
goto :eof

:clean_ollama
echo [AI] Cleaning Ollama models/cache...
rmdir /s /q "%USERPROFILE%\.ollama" >nul 2>&1
goto :eof

:clean_insightface
echo [AI] Cleaning InsightFace cache...
rmdir /s /q "%USERPROFILE%\.insightface" >nul 2>&1
goto :eof

:clean_discord
echo [APP] Cleaning Discord cache...
rmdir /s /q "%LOCALAPPDATA%\Discord\Cache" >nul 2>&1
rmdir /s /q "%LOCALAPPDATA%\Discord\Code Cache" >nul 2>&1
goto :eof

:clean_capcut
echo [APP] Cleaning CapCut cache...
rmdir /s /q "%LOCALAPPDATA%\CapCut\User Data\Default\Cache" >nul 2>&1
rmdir /s /q "%LOCALAPPDATA%\CapCut\User Data\Default\Code Cache" >nul 2>&1
goto :eof

:clean_roblox
echo [APP] Cleaning Roblox cache...
rmdir /s /q "%LOCALAPPDATA%\Roblox" >nul 2>&1
goto :eof

:: ------------------------------
:: End
:: ------------------------------
:end
cls
echo ===============================================================
echo                    THANK YOU BRO 😎
echo ===============================================================
echo.
echo ALBAS CLEANER closed successfully.
echo.
timeout /t 2 >nul
exit