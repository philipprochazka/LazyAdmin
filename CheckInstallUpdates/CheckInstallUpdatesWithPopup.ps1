# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Write-Output "Elevating privileges within the current terminal session..."
  # Restart the script using 'sudo' for inline elevation in PowerShell Core
  sudo pwsh -NoProfile -ExecutionPolicy Bypass -Command "& { . '$PSCommandPath' }"
  exit
}

# Function to show a pop-up message
function Show-PopupMessage {
  param (
      [string]$Message,
      [string]$Title = "Windows Update Status",
      [ValidateSet("Information", "Warning", "Error")]
      [string]$IconType = "Information"
  )
  Add-Type -AssemblyName PresentationFramework
  $IconMap = @{
      Information = "Information";
      Warning = "Warning";
      Error = "Error"
  }
  [System.Windows.MessageBox]::Show($Message, $Title, [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::$IconMap[$IconType])
}

# Function to check and install the Windows Update module
function Install-WindowsUpdateModule {
  if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
      Write-Output "PSWindowsUpdate module is not installed. Installing..."
      try {
          Install-Module -Name PSWindowsUpdate -Force -AllowClobber -ErrorAction Stop
          Write-Output "PSWindowsUpdate module installed successfully."
      } catch {
          Write-Error "Failed to install PSWindowsUpdate module. Error: $_"
          Show-PopupMessage -Message "Failed to install PSWindowsUpdate module." -IconType "Error"
          exit
      }
  } else {
      Write-Output "PSWindowsUpdate module is already installed."
  }
}

# Install the PSWindowsUpdate module if necessary
Install-WindowsUpdateModule

# Import the module
Import-Module PSWindowsUpdate -Force

# Check for updates
Write-Output "Checking for available updates..."
try {
  $Updates = Get-WindowsUpdate -AcceptAll -IgnoreReboot

  if ($Updates) {
      Write-Output "Updates found. Installing updates..."
      Install-WindowsUpdate -AcceptAll -IgnoreReboot -ForceDownload -ErrorAction Stop
      Write-Output "Updates installed successfully."
      Show-PopupMessage -Message "Updates were installed successfully." -IconType "Information"
  } else {
      Write-Output "No updates available."
      Show-PopupMessage -Message "No updates were needed." -IconType "Information"
  }
} catch {
  Write-Error "An error occurred during the update process. Error: $_"
  Show-PopupMessage -Message "An error occurred during the update process." -IconType "Error"
  exit
}

Write-Output "`n===================================="
Write-Output " All updates checked and processed. "
Write-Output "===================================="
