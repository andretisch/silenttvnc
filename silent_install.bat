@rem dpass переменная для пароля по умолчанию
@set dpass=123456

@echo ------------------------------------------------------------------------
@echo СКРИПТ ТИХОЙ И БЫСТРОЙ УСТАНОВКИ TIGHTVNC.
@echo версия v1.0
@echo.
@echo ВНИМАНИЕ!!! Этот скрипт должен быть в тойже папке где и файлы установки
@echo tightvnc-2.7.10-setup-32bit.msi и tightvnc-2.7.10-setup-64bit.msi
@echo.
@echo ЗАПУСКАТЬ С ПРАВАМИ АДМИНИСТРАТОРА!
@echo.
@echo ------------------------------------------------------------------------
@echo.
@set /P upass= "Введите пароль (нажмите Ввод для пароля %dpass%):"
@echo.
@if "%upass%" == "" (
  @set upass=%dpass%
)
@cd %TMP%

@echo Копирование временных файлов!
@echo.
@if exist "C:\Program Files (x86)" (
  echo f | xcopy /s/y %~dp0tightvnc-2.7.10-setup-64bit.msi %TMP%\tightvnc-2.7.10-setup.msi
  @set bitx=64
  
) else (
  echo f | xcopy /s/y %~dp0tightvnc-2.7.10-setup-32bit.msi %TMP%\tightvnc-2.7.10-setup.msi
  @set bitx=32
)

@echo.
@echo Система %bitx% бита. Установка tightvnc ....
@msiexec.exe /i tightvnc-2.7.10-setup.msi /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=%upass% SET_VIEWONLYPASSWORD=1 VALUE_OF_VIEWONLYPASSWORD=%upass% SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=%upass%
@echo.

@if exist "C:\Program Files\TightVNC\" (
	@echo Готово. Пароль: %upass%
	@echo Удаление временных файлов
	@del %TMP%\tightvnc-2.7.10-setup.msi
  
) else (
	@echo ВНИМАНИЕ ОШИБКА!
	@echo Что-то пошло не так! А я запущент от Админа? Удалите предыдущую версию Tightvnc если она есть. 
	@del %TMP%\tightvnc-2.7.10-setup.msi
)

@pause
start  https://hostlip.ru/tightvnc-tixaya-ustanovka/