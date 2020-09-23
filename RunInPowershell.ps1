# Funktioner
function testLast {
	if($?) {
   	"command succeeded`n"
	}
	else {
	   "command failed`n"
	}
}

# Ægte kode

# Microsoft

# Bing
echo "Removing: BingWeather";
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage;
testLast

echo "Removing: Bing News";
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage;
testLast

echo "Removing: Bing Sports";
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage;
testLast


# Games
echo "Removing: Candy crush saga";
Get-AppxPackage king.com.CandyCrushSaga | Remove-AppxPackage;
testLast

echo "Removing: Candy crush friends";
Get-AppxPackage king.com.CandyCrushFriends | Remove-AppxPackage;
testLast

echo "Removing: Bubble witch 3 saga";
Get-AppxPackage king.com.BubbleWitch3Saga | Remove-AppxPackage;
testLast;

echo "Removing: Microsoft Solitaire Collection";
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage;
testLast

echo "Removing: Mahjong";
Get-AppxPackage *Mahjong* -AllUsers | Remove-AppxPackage;
testLast


echo "Removing: LinkedInForWindows";
Get-AppxPackage 7EE7776C.LinkedInforWindows | Remove-AppxPackage;
testLast

echo "Removing: Your Phone";
Get-AppxPackage *Microsoft.YourPhone* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: Alarms and clocks";
Get-AppxPackage *windowsalarms* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: Windows mail";
Get-AppxPackage *windowscommunicationsapps* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: OfficeHub";
Get-AppxPackage *OfficeHub* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: Get Started";
Get-AppxPackage *getstarted* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: Groove Music";
Get-AppxPackage *zunemusic* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: Maps";
Get-AppxPackage *windowsmaps* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: Netflix";
Get-AppxPackage Netflix* -AllUsers | Remove-AppxPackage;
testLast

echo "Removing: Deezer Music";
Get-AppxPackage *Deezer* -AllUsers | Remove-AppxPackage;
testLast

# ----
# Creating custom poweroff/reboot/sleep scripts
$SLEEP = "rundll32.exe powrprof.dll,SetSuspendState 0,1,0"
$SLEEP | Set-Content $HOME\Documents\"Sleep.bat"

$POWEROFF = "shutdown -s -t 0"
$POWEROFF | Set-Content $HOME\Documents\"Poweroff.bat"
$POWEROFF | Set-Content $HOME\Documents\"Shutdown.bat"


$REBOOT = "shutdown -r -t 0"
$REBOOT | Set-Content $Home\Documents\"Reboot.bat"


# ---

$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
Stop-Process -processname explorer
echo "Hidden folders, filename extensions and superhidden are now visible"
Start-Sleep -s 2

echo "Setting dark mode"
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
testLast
Start-Sleep -s 1

echo "opening display settings"
start ms-settings:display

echo "opening performance settings"
SystemPropertiesPerformance.exe
echo " [ ]`n [ ]`n [x]`n [x]`n [ ]`n [x]`n [x]`n [ ]`n [ ]`n [ ]`n [x]`n [ ]`n [ ]`n [x]`n [x]`n [x]`n [ ]`n"

echo "opening battery settings"
control powercfg.cpl


#Download and start Ninite:
echo "Initiating Ninite"

$URL = "https://ninite.com/.net4.8-adoptjavax11-chrome-everything-foobar-greenshot-spotify-vlc-winrar-winscp-skype-notepadplusplus/ninite.exe"
$DATE = Get-Date -Format "MMddyy"
$FILENAME = "$DATE-Ninite_JM_Sane_Defaults" 
$OUTPUT = "$HOME\Downloads\$FILENAME.exe"

Invoke-WebRequest -Uri $URL -OutFile $OUTPUT
start $HOME\Downloads\$FILENAME

