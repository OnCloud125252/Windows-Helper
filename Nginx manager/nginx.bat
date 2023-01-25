@ECHO OFF


::: Command Config
:: Path of Nginx *required*
SET nginx_Dir=C:\Program Files\nginx-1.22.1
:: Name of preferred editor *required*
SET editor_name=code-insiders
:: Option for preferred editor *optional*
SET editor_options=-w
::: END


::: Check if user insert option
IF "%~1"=="" (
    ECHO nginx: no option insert !
    GOTO quit
)
::: END


::: Check if user insert more then one option
IF "%~2"=="" (
    GOTO continue
) ELSE (
    ECHO nginx: invalid option [%*] !
    GOTO quit
)
::: END


::: Check the option and run command
:continue
:: Detect if nginx is already running
TASKLIST /fi "IMAGENAME eq nginx.exe" /fo csv 2>NUL | FIND /I "nginx.exe">NUL
IF "%ERRORLEVEL%"=="0" (
    SET nginx_isRunning=true
) ELSE (
    SET nginx_isRunning=false
)
:: Add the option here using "if...else if" statement
SET currentDirectory=%CD%
IF %1==test (
    GOTO cmdTest
) ELSE IF %1==help (
    GOTO cmdHelp
) ELSE IF %1==start (
    GOTO cmd1
) ELSE IF %1==config (
    GOTO cmd2
) ELSE IF %1==reload (
    GOTO cmd3
) ELSE IF %1==stop (
    GOTO cmd4
) ELSE IF %1==quit (
    GOTO cmd5
) ELSE IF %1==clear (
    GOTO cmd6
)
ECHO nginx: invalid option [%*] !
GOTO quit
::: END


::: Commands
:cmdHelp &:: Help
ECHO.
ECHO +------------------------------------------------------------+
ECHO.       This is a CLI tool for managing Nginx on Windows
ECHO +------------------------------------------------------------+
ECHO.   OPTION   ^>  DESCRIPTION
ECHO +------------------------------------------------------------+
ECHO.   help     ^>  Display a list of command.
ECHO.   start    ^>  Start Nginx service.
ECHO.   config   ^>  Open config file using %editor_name%.
ECHO.   reload   ^>  Reload Nginc with latest config file.
ECHO.   stop     ^>  Fast shutdown Nginx.
ECHO.   quit     ^>  Graceful shutdown Nginx.
ECHO.   clear    ^>  Exit all running Nginx processes.
ECHO +------------------------------------------------------------+
ECHO.
GOTO quit

:cmd1 &:: Start
IF %nginx_isRunning%==true (
    ECHO Nginx is already running
) ELSE IF %nginx_isRunning%==false (
    ECHO Starting Nginx...
    CD %nginx_Dir%
    START nginx
    IF ERRORLEVEL 0 (
        ECHO Success
    ) ELSE (
        ECHO Failed
    )
    CD %currentDirectory%
)
GOTO quit

:cmd2 &:: Config
ECHO Opening config file
%editor_name% "%nginx_Dir%\conf\nginx.conf" %editor_options%
GOTO quit

:cmd3 &:: Reload
IF %nginx_isRunning%==true (
    ECHO Reloading Nginx...
    CD %nginx_Dir%
    ".\nginx.exe" -s reload 1>NUL 2>NUL
    IF "%ERRORLEVEL%"=="0" (
        ECHO Success
    ) ELSE (
        ECHO Failed
    )
    CD %currentDirectory%
) ELSE IF %nginx_isRunning%==false (
    ECHO Nginx is not running
)
GOTO quit

:cmd4 &:: Stop
IF %nginx_isRunning%==true (
    ECHO Stopping Nginx...
    CD %nginx_Dir%
    ".\nginx.exe" -s stop 1>NUL 2>NUL
    IF "%ERRORLEVEL%"=="0" (
        ECHO Success
    ) ELSE (
        ECHO Failed
    )
    CD %currentDirectory%
) ELSE IF %nginx_isRunning%==false (
    ECHO Nginx is not running
)
GOTO quit

:cmd5 &:: Quit
IF %nginx_isRunning%==true (
    ECHO Quitting Nginx...
    CD %nginx_Dir%
    ".\nginx.exe" -s quit 1>NUL 2>NUL
    IF "%ERRORLEVEL%"=="0" (
        ECHO Success
    ) ELSE (
        ECHO Failed
    )
    CD %currentDirectory%
) ELSE IF %nginx_isRunning%==false (
    ECHO Nginx is not running
)
GOTO quit

:cmd6 &:: Clear
IF %nginx_isRunning%==true (
    ECHO Exiting all Nginx processes...
    taskkill /f /im nginx.exe 1>NUL 2>NUL
    IF "%ERRORLEVEL%"=="0" (
        ECHO Success
    ) ELSE (
        ECHO Failed
    )
) ELSE IF %nginx_isRunning%==false (
    ECHO Nginx is not running
)
GOTO quit

:cmdTest &:: Test
ECHO No test command provided
GOTO quit
::: END


::: Clear variables and exit program.
:quit
SET ERRORLEVEL=
SET currentDirectory=
SET nginx_isRunning=
SET nginx_Dir=
SET editor_name=
SET editor_options=
::: END