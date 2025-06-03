# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Write-Output "Restarting the script with administrative privileges..."
  Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
  exit
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
$Updates = Get-WindowsUpdate -AcceptAll -IgnoreReboot

if ($Updates) {
  Write-Output "Updates found. Installing updates..."
  Install-WindowsUpdate -AcceptAll -IgnoreReboot -ForceDownload -ErrorAction Stop
  Write-Output "Updates installed successfully."
} else {
  Write-Output "No updates available."
}

Write-Output "Windows Update check and installation completed."
