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
Write-Output "Removing: BingWeather";
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage;
testLast

Write-Output "Removing: Bing News";
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage;
testLast

Write-Output "Removing: Bing Sports";
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage;
testLast


# Games
Write-Output "Removing: Candy crush saga";
Get-AppxPackage king.com.CandyCrushSaga | Remove-AppxPackage;
testLast

Write-Output "Removing: Candy crush friends";
Get-AppxPackage king.com.CandyCrushFriends | Remove-AppxPackage;
testLast

Write-Output "Removing: Bubble witch 3 saga";
Get-AppxPackage king.com.BubbleWitch3Saga | Remove-AppxPackage;
testLast;

Write-Output "Removing: Microsoft Solitaire Collection";
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage;
testLast

Write-Output "Removing: Mahjong";
Get-AppxPackage *Mahjong* -AllUsers | Remove-AppxPackage;
testLast


Write-Output "Removing: LinkedInForWindows";
Get-AppxPackage 7EE7776C.LinkedInforWindows | Remove-AppxPackage;
testLast

Write-Output "Removing: Your Phone";
Get-AppxPackage *Microsoft.YourPhone* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: Alarms and clocks";
Get-AppxPackage *windowsalarms* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: Windows mail";
Get-AppxPackage *windowscommunicationsapps* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: OfficeHub";
Get-AppxPackage *OfficeHub* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: Get Started";
Get-AppxPackage *getstarted* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: Groove Music";
Get-AppxPackage *zunemusic* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: Maps";
Get-AppxPackage *windowsmaps* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: Netflix";
Get-AppxPackage Netflix* -AllUsers | Remove-AppxPackage;
testLast

Write-Output "Removing: Deezer Music";
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
Write-Output "Hidden folders, filename extensions and superhidden are now visible"
Start-Sleep -s 2

Write-Output "Setting dark mode"
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
testLast
Start-Sleep -s 1

Write-Output "opening display settings"
start ms-settings:display

Write-Output "opening performance settings"
SystemPropertiesPerformance.exe
Write-Output "--- USE THESE SETTINGS ---`n`n [ ]`tAnimate Controls and elements inside windows`n [ ]`tAnimate windwos when minimising and maximising`n [x]`tAnimations in the taskbar`n [x]`tEnable Peek`n [ ]`tFade or slide menus into view`n [x]`tFade or slide ToolTips into view`n [x]`tFade out menu items after clicking`n [ ]`tSave taskbar thumbnail previews`n [ ]`tShow shadows under mouse pointer`n [ ]`tShow shadows under windows`n [x]`tShow thumbnails instead of icons`n [ ]`tShow translucendt selection rectangle`n [ ]`tShow window content when dragging`n [x]`tSlide open combo boxes`n [x]`tSmooth edges of screen fonts`n [x]`tSmooth-scroll list boxes`n [ ]`tUse drop shadows for icon labels on the desktop`n"
Write-Output "opening battery settings"
control powercfg.cpl


#Download and start Ninite:
Write-Output "Initiating Ninite"

$URL = "https://ninite.com/.net4.8-adoptjavax11-chrome-everything-foobar-greenshot-spotify-vlc-winrar-winscp-skype-notepadplusplus/ninite.exe"
$DATE = Get-Date -Format "MMddyy"
$FILENAME = "$DATE-Ninite_JM_Sane_Defaults" 
$OUTPUT = "$HOME\Downloads\$FILENAME.exe"

Invoke-WebRequest -Uri $URL -OutFile $OUTPUT
start $HOME\Downloads\$FILENAME


#Download and start Brave browser installation:
Write-Output "Installing Brave Browser"
$URL = "https://laptop-updates.brave.com/latest/winx64"
$FILENAME = "$DATE-Brave-Setup.exe"

Invoke-WebRequest -Uri $URL -OutFile $OUTPUT
start $HOME\Downloads\$FILENAME
