@ECHO off
:: Construct Filepaths
SET "AFANASY_DIR"
SET "AFANASY_ZIP"
SET "AFANASY_SOURCE"
SET "AFANASY_SETUP"
SET "AFANASY_ENVIRONMENT"

SET "SHORTCUTS"
SET "AFANASY_CLIENT=%SHORTCUTS%\AfanasyClient.lnk"
SET "AFANASY_RENDER=%SHORTCUTS%\AfanasyRender.lnk"

SET "STARTUP=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

:: Unpack Afanasy
@ECHO on
IF EXIST %AFANASY_DIR% GOTO :ALREADYINSTALLED
    ECHO [ Unzip AFANASY ]
    python -c "import zipfile; z=zipfile.ZipFile(r'%AFANASY_ZIP%'); z.extractall(r'C:'); z.close()"

:ALREADYINSTALLED

:: Setup Afanasy Environment
ECHO [ Setup AFANASY Environment ]
CALL %AFANASY_SETUP%

:: Set Afanasy Server
ECHO [ Setup AFANASY Server ]
SET /P AFANASY_SERVER=Please enter Server IP: || SET AFANASY_SERVER=192.168.1.235

python %AFANASY_ENVIRONMENT% -k af_servername -v %AFANASY_SERVER%
ECHO Set Server : %AFANASY_SERVER%

:: Set Afanasy Capacity
SET /a CAPACITY = %NUMBER_OF_PROCESSORS%/2
python %AFANASY_ENVIRONMENT% -k af_render_default_capacity -v %CAPACITY%
python %AFANASY_ENVIRONMENT% -k af_task_default_capacity -v %CAPACITY%
ECHO Set Capacity : %CAPACITY%

:: Run Render and Client
ECHO [ Run AFANASY ]
START %AFANASY_RENDER%
START %AFANASY_CLIENT%

ECHO [ Copy AFANASY to Startup ]

@ECHO off
:: Copy Render and Client to startup folder
ECHO f | xcopy /f /y "%AFANASY_RENDER%" "%STARTUP%\AfanasyRender.lnk"
ECHO f | xcopy /f /y "%AFANASY_CLIENT%" "%STARTUP%\AfanasyClient.lnk"
pause
