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


# Changes to explorer
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
Stop-Process -processname explorer
Write-Output "Hidden folders, filename extensions and superhidden are now visible"
Start-Sleep -s 2

# Dark mode
Write-Output "Setting dark mode"
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
testLast
Start-Sleep -s 1


# ---


# Displaysettings
Write-Output "opening display settings"
start ms-settings:display

# Performance setttings
Write-Output "opening performance settings"
SystemPropertiesPerformance.exe
Write-Output "--- USE THESE SETTINGS ---`n`n [ ]`tAnimate Controls and elements inside windows`n [ ]`tAnimate windwos when minimising and maximising`n [x]`tAnimations in the taskbar`n [x]`tEnable Peek`n [ ]`tFade or slide menus into view`n [x]`tFade or slide ToolTips into view`n [x]`tFade out menu items after clicking`n [ ]`tSave taskbar thumbnail previews`n [ ]`tShow shadows under mouse pointer`n [ ]`tShow shadows under windows`n [x]`tShow thumbnails instead of icons`n [ ]`tShow translucendt selection rectangle`n [ ]`tShow window content when dragging`n [x]`tSlide open combo boxes`n [x]`tSmooth edges of screen fonts`n [x]`tSmooth-scroll list boxes`n [ ]`tUse drop shadows for icon labels on the desktop`n"


# ---
# Special thanks to 
# Credit to Disassembler0 at https://github.com/Disassembler0/Win10-Initial-Setup-Script/

# Show all tray icons
Function ShowTrayIcons {
	Write-Output "Showing all tray icons..."
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutoTrayNotify" -Type DWord -Value 1
}
ShowTrayIcons


# Show Control panel shortcut on desktop
Function ShowControlPanelOnDesktop {
	Write-Output "Showing Control panel shortcut on desktop..."
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" -Type DWord -Value 0
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" -Type DWord -Value 0
}
ShowControlPanelOnDesktop


# Show small icons in taskbar
Function ShowSmallTaskbarIcons {
	Write-Output "Showing small icons in taskbar..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -Type DWord -Value 1
}
ShowSmallTaskbarIcons


# End Disassembler0 code


# ---


$DownloadDestination = "$HOME\Downloads\JM_setup"
If(!(Test-Path $DownloadDestination))
{
      New-Item -ItemType Directory -Path $DownloadDestination

}

$DATE = Get-Date -Format "MMddyy"


#Download and start Ninite:
Write-Output "Initiating Ninite"

$URL = "https://ninite.com/.net4.8-adoptjavax11-chrome-foobar-greenshot-spotify-vlc-winrar-winscp-skype-notepadplusplus/ninite.exe"
$FILENAME = "$DATE - Ninite_JM_Sane_Defaults.exe" 
$OUTPUT = "$DownloadDestination\$FILENAME"

Invoke-WebRequest -Uri $URL -OutFile $OUTPUT
Invoke-Item $DownloadDestination\$FILENAME



#Download and start Brave browser installation:
Write-Output "Installing Brave Browser"

$URL = "https://laptop-updates.brave.com/latest/winx64"
$FILENAME = "$DATE - Brave_Setup.exe"
$OUTPUT = "$DownloadDestination\$FILENAME"

Invoke-WebRequest -Uri $URL -OutFile $OUTPUT
Invoke-Item $DownloadDestination\$FILENAME



#Download and start Voidtools Everything installation:
Write-Output "Installing Voidtools Everything"

$URL = "https://www.voidtools.com/Everything-1.4.1.999.x64-Setup.exe"
$FILENAME = "$DATE - Everything_setup.exe"
$OUTPUT = "$DownloadDestination\$FILENAME"

Invoke-WebRequest -Uri $URL -OutFile $OUTPUT
Invoke-Item $DownloadDestination\$FILENAME
