@echo off
color 0B
title APK - Advanced Process Killer
start /b curl -s -o nul https://api.countapi.xyz/hit/tokken/keystartA9C5ABC900

net session >nul 2>&1
if %errorlevel% == 0 (
    echo The command prompt is running as an administrator, Enjoy.
) else (
    echo Please restart in administrator mode if you need to kill a system process.
)


:killprocess
    cls
    :skipcls
    echo Welcome to APK - Advanced Process Killer, made with love by tokken?#6694
    echo ===============================================================
    echo [1] - Show all Tasks                             [2] - Restart explorer
    echo [3] - Clean your computer from useless files     [4] - Send a request to a api
    echo.
    echo [!] - Options below require administrator
    echo.
    echo [5] - Move APK to start menu                     [6] - Remove APK from start menu
    echo [7] - Stop windows updates
    echo ===============================================================
    echo Enter the name or PID of the process to kill:
    set /p process_name=
    if %process_name% == 1 (
        goto tasks
    ) else if %process_name% == 2 (
        goto restartexplorer
    ) else if %process_name% == 3 (
        goto cleanpc
    ) else if %process_name% == 4 (
        goto sendreq
    ) else if %process_name% == 5 (
        goto movetostartmenu
    ) else if %process_name% == 6 (
        goto removefromstartmenu
    ) else if %process_name% == 7 (
        goto stopwindowsupdates
    ) else (
        goto killtask
    )


:killtask
    cls
    taskkill /f /pid %process_name% /im %process_name% 2>nul>nul
    tasklist | find "%process_name%" 2>nul>nul
    if %errorlevel% == 0 (
        cls
        color 04
        echo %process_name% Didn't get terminated or doesn't exist.
        timeout 3 2>nul>nul
        color 0B
    ) else (
        cls
        color 02
        echo %process_name% Has been terminated.
        timeout 3 2>nul>nul
        color 0B
    )
    goto killprocess

:restartexplorer
    cls
    taskkill /f /im explorer.exe 2>nul>nul
    start /im explorer.exe 2>nul>nul
    tasklist | find explorer.exe 2>nul>nul
    if %errorlevel% == 0 (
        cls
        color 04
        echo Explorer failed to restart.
        timeout 3 2>nul>nul
        color 0B
    ) else (
        cls
        color 02
        echo Explorer successfully restarted.
        timeout 3 2>nul>nul
        color 0B
    )
    goto killprocess


:tasks
    cls
    tasklist /svc
    echo.
    goto skipcls


:cleanpc
    cls
    net session >nul 2>&1
    if %errorlevel% == 0 (
        cls
        color 04
        echo Please disable administrator to clean your pc.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    ) else (
        color 0E
        echo Please wait...
        del C:\Windows\Prefetch 2>nul>nul
        cd /d C:\Users\%USERNAME%\Downloads
        for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
        cd /d %~dpf0
        rd C:\$Recycle.Bin 2>nul>nul
        cleanmgr.exe /sagerun:n 2>nul>nul
        cls
        color 02
        echo Your system has been cleared of useless stuff.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    )

:movetostartmenu
    net session >nul 2>&1
    if %errorlevel% == 0 (
        cls
        mkdir "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Advanced Process Killer\"
        xcopy "%~dp0apk.bat" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Advanced Process Killer\" /D /E /H /I /Y
        goto killprocess
    ) else (
        cls
        color 04
        echo Please start APK as administrator to add APK to start menu.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    )

:removefromstartmenu
    net session >nul 2>&1
    if %errorlevel% == 0 (
        cls
        cd /d "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Advanced Process Killer\"
        for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
        goto killprocess
    ) else (
        cls
        color 04
        echo Please start APK as administrator to remove APK from start menu.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    )

:stopwindowsupdates
    net session >nul 2>&1
    if %errorlevel% == 0 (
        cls
        color 0E
        echo Adding file to autostart...
        del %programdata%\Microsoft\Windows\Start Menu\Programs\Startup\stopwindowsupdates.bat
        cd /d %programdata%\Microsoft\Windows\Start Menu\Programs\Startup
        echo net stop wuauserv>stopwindowsupdates.bat
        net stop wuauserv
        color 02
        cls
        echo Successfully added .bat to autostart, windows updates will no longer start.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    ) else (
        cls
        color 04
        echo Please start APK as administrator to stop windows updates.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    )

:sendreq
    cls
    color 0E
    echo Please type in the request link:
    set /p apilink=
    start /b curl -s -o nul %apilink%
    echo Sent request to %apilink%
    timeout 5 2>nul>nul
    color 0B
    goto killprocess
