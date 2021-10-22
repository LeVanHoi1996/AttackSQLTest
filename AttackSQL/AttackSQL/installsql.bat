@echo off
:: BatchGotAdmin (Run as Admin code starts)
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
exit /B

:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
echo "Dir: %~dp0"
CD /D "%~dp0"
CD Tools
pause

@echo -----Vui long cho cai dat DotNet Framework-----


@ECHO ----- Dang khoi tao du lieu ban dau vui long cho 10 phut ...!----- 
date/t 
time /t 

:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
echo 64-bit...
start /wait msiexec /i SqlLocalDB.msi /qn IACCEPTSQLLOCALDBLICENSETERMS=YES
GOTO END

:32BIT
echo 32-bit...
start /wait msiexec /i SqlLocaLDB32.msi /qn IACCEPTSQLLOCALDBLICENSETERMS=YES
GOTO END

:END
date/t 
time /t


date/t 
time /t

pause

@echo -----Cai dat SQL thanh cong-----

@echo -----Buoc 1: Vui long cho cau hinh SQL Server-----

