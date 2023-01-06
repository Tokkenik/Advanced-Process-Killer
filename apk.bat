@echo off
net session >nul 2>&1
if %errorlevel% == 0 (
    echo The command prompt is running as an administrator, Enjoy.
) else (
    echo Please restart in administrator mode if you need to kill a system process.
)
echo.
title APK - Advanced Process Killer
echo Welcome to APK - Advanced Process Killer, made with love by tokken?#6694
echo.
echo Type in 'tasks' to show the process list.
echo Type in 'rexplorer' to restart explorer safely.
echo Type in 'clean' to free up space. (Administrator recommended, not needed.)
echo.
:killprocess
    echo Enter the name of the process to kill:
    set /p process_name=
    if %process_name% == tasks (
        cls
        tasklist
        echo.
    ) else if %process_name% == rexplorer (
        taskkill /f /im explorer.exe 2>nul>nul
        start /im explorer.exe 2>nul>nul
        timeout 2 2>nul>nul
        cls
        echo Explorer successfully restarted.
        echo.
    ) else if %process_name% == clean (
        echo Please wait...
        del C:\Windows\Prefetch 2>nul>nul
        rd C:\$Recycle.Bin 2>nul>nul
        cleanmgr.exe /sagerun:3 2>nul>nul
        cls
        echo Your system has been cleared of useless stuff.
        echo.
    ) else (
        taskkill /f /im %process_name% 2>nul>nul
        tasklist | find "%process_name%" 2>nul>nul
        if %errorlevel% == 0 (
            cls
            echo %process_name% Didn't get terminated.
        ) else (
            cls
            echo %process_name% Has been terminated.
        )
        echo.
    )
goto killprocess