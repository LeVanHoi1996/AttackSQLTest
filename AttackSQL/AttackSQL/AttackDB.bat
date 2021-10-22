@echo off
:: BatchGotAdmin (Run as Admin code starts)
:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line
::REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 5 /f

::C:\Windows\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
::ping -n 3 127.0.0.1 >NUL
::REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0x0 /f

@echo ----- Vui long cho cau hinh du lieu-----

::icacls Database /grant John:(OI)(CI)F /T

SET DatabaseName='TSSort_NhomKinh'

SET CurrentDir='%~dp0Database\TSSort_NhomKinh.mdf'
ECHO %CurrentDir%
pause
::icacls %CurrentDir% /grant John:(OI)(CI)F /T
::SET CurrentDir2='%~dp0Database\AdalinePos_1.ldf'
::icacls %CurrentDir2% /grant John:(OI)(CI)F /T
sqlcmd -S (localdb)\TSSort -Q "IF NOT EXISTS (select * from dbo.sysdatabases where name = %DatabaseName%) BEGIN EXEC sp_attach_single_file_db %DatabaseName%,%CurrentDir% END" -b -o out.log
pause

ping -n 5 127.0.0.1 >NUL

pause

NET STOP MSSQL$TSSort
NET START MSSQL$TSSort


@echo ----- Attach du lieu thanh cong-----
@echo ----- Attach du lieu thanh cong-----
@echo ----- Attach du lieu thanh cong-----
pause

