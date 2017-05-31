:: Map Drives
net use N: \\10.10.10.10\2 /persistent:no
net use Z: \\20.20.20.20\2 /persistent:no

@ECHO off

:: Construct Filepaths
SET "TEMPDIR=C:\Users\%USERNAME%\AppData\Local\Temp"
SET "ZDIR=\\192.168.1.95\content\common\bin\setup\lib"
SET "DESKTOP=C:\Users\%USERNAME%\Desktop"

SET "DISKSETUP=%TEMPDIR%\diskLinkSetup.py"
SET "ENVSETUP=%TEMPDIR%\envSetup.py"

SET "SHORTCUT=%ZDIR%\"
SET "LXML=%TEMPDIR%\lxml-3.6.4-cp27-cp27m-win_amd64.whl"

SET "PIP=%TEMPDIR%\get-pip.py"

:: Copying Files
ECHO [ COPYING PIPELINE SETUP FILES ]
ECHO f | xcopy /f /y %ZDIR%\diskLinkSetup.py %DISKSETUP%
ECHO f | xcopy /f /y %ZDIR%\envSetup.py %ENVSETUP%

ECHO f | xcopy /f /y %ZDIR%\lxml-3.6.4-cp27-cp27m-win_amd64.whl %LXML%
ECHO f | xcopy /f /y "%SHORTCUT%" "%DESKTOP%\Content Tools.lnk"

:: Run Environment Setup
ECHO [   RUN PIPELINE SETUP FILES   ]
C:\Python27\python.exe %DISKSETUP%
C:\Python27\python.exe %ENVSETUP%

:: Download PIP
ECHO [ DOWNLOAD PIP ]
bitsadmin.exe /transfer "DownloadPIP" https://bootstrap.pypa.io/get-pip.py %PIP%

:: Install PIP
ECHO [ INSTALL PIP ]
C:\Python27\python.exe %PIP%

C:\Python27\Scripts\pip.exe install --upgrade pip
C:\Python27\Scripts\pip.exe install PySide
C:\Python27\Scripts\pip.exe install requests
C:\Python27\Scripts\pip.exe install Django==1.7.6
C:\Python27\Scripts\pip.exe install python-pptx
C:\Python27\Scripts\pip.exe install pillow
C:\Python27\Scripts\pip.exe install jsonschema
C:\Python27\Scripts\pip.exe install pyopenssl ndg-httpsclient pyasn1
C:\Python27\Scripts\pip.exe install unicodecsv
C:\Python27\Scripts\pip.exe install ftrack-python-api
C:\Python27\Scripts\pip.exe install GitPython
C:\Python27\Scripts\pip.exe install %LXML%

pause
