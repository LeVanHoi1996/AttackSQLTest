@echo off
:: BatchGotAdmin (Run as Admin code starts)
SETLOCAL
SET DBFILE11="C:\Program Files\Microsoft SQL Server\120\Tools\Binn\\bo"
SET DBFILE13="C:\Program Files\Microsoft SQL Server\130\Tools\Binn\\bo"
SET DBFILE14="C:\Program Files\Microsoft SQL Server\140\LocalDB\Binn"

IF EXIST "%DBFILE11%" (GOTO 110) ELSE if EXIST "%DBFILE13%" (GOTO 130) ELSE (GOTO 140)


:110
::echo C:\Program Files\Microsoft SQL Server\110\LocalDB\Binn...
echo %DBFILE11%
cd %DBFILE11%
GOTO END

:130
::echo C:\Program Files\Microsoft SQL Server\130\LocalDB\Binn
echo %DBFILE13%
cd %DBFILE13%
GOTO END
:140
echo %DBFILE14%
cd %DBFILE14%
GOTO END
:END
pause 
::start /wait SqlLocalDb.exe create "MSSQLLocalDB" -s

date/t 
time /t

start /wait SqlLocalDb create TSSoft -s
date/t 
time /t
@echo -----check version-----


PAUSE
::start /wait SqlLocalDb create adaline
date/t 
time /t


@echo -----Buoc 1: Vui long cho cau hinh SQL Server-----
::%DBFILE% %DBFILE% SqlLocalDb create adaline && Exit
::C:\Program Files\Microsoft SQL Server\110\LocalDB\Binn\SqlLocalDb create adaline1