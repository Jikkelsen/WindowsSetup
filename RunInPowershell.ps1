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

echo "opening nitnite"
start microsoft-edge:https://ninite.com/.net4.8-adoptjavax11-chrome-foobar-klitecodecs-spotify-vlc-winrar-winscp/