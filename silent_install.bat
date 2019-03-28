@rem dpass ��६����� ��� ��஫� �� 㬮�砭��
@set dpass=123456

@echo ------------------------------------------------------------------------
@echo ������ ����� � ������� ��������� TIGHTVNC.
@echo ����� v1.0
@echo.
@echo ��������!!! ��� �ਯ� ������ ���� � ⮩�� ����� ��� � 䠩�� ��⠭����
@echo tightvnc-2.7.10-setup-32bit.msi � tightvnc-2.7.10-setup-64bit.msi
@echo.
@echo ��������� � ������� ��������������!
@echo.
@echo ------------------------------------------------------------------------
@echo.
@set /P upass= "������ ��஫� (������ ���� ��� ��஫� %dpass%):"
@echo.
@if "%upass%" == "" (
  @set upass=%dpass%
)
@cd %TMP%

@echo ����஢���� �६����� 䠩���!
@echo.
@if exist "C:\Program Files (x86)" (
  echo f | xcopy /s/y %~dp0tightvnc-2.7.10-setup-64bit.msi %TMP%\tightvnc-2.7.10-setup.msi
  @set bitx=64
  
) else (
  echo f | xcopy /s/y %~dp0tightvnc-2.7.10-setup-32bit.msi %TMP%\tightvnc-2.7.10-setup.msi
  @set bitx=32
)

@echo.
@echo ���⥬� %bitx% ���. ��⠭���� tightvnc ....
@msiexec.exe /i tightvnc-2.7.10-setup.msi /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=%upass% SET_VIEWONLYPASSWORD=1 VALUE_OF_VIEWONLYPASSWORD=%upass% SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=%upass%
@echo.

@if exist "C:\Program Files\TightVNC\" (
	@echo ��⮢�. ��஫�: %upass%
	@echo �������� �६����� 䠩���
	@del %TMP%\tightvnc-2.7.10-setup.msi
  
) else (
	@echo �������� ������!
	@echo ��-� ��諮 �� ⠪! � � ����饭� �� ������? ������ �।����� ����� Tightvnc �᫨ ��� ����. 
	@del %TMP%\tightvnc-2.7.10-setup.msi
)

@pause
start  https://hostlip.ru/tightvnc-tixaya-ustanovka/