@echo off
:: BatchGotAdmin (Run as Admin code starts)
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
echo 64-bit...
GOTO END

:32BIT
echo 32-bit...
GOTO END

:END
date/t 
time /t

PAUSE


@echo -----Cai dat SQL thanh cong-----

@echo -----Buoc 1: Vui long cho cau hinh SQL Server-----

