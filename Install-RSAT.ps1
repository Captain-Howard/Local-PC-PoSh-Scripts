<#
.SYNOPSIS
  Installs RSAT 
.DESCRIPTION
   Finds log of desired RSAT tools, disables WSUS, installs foreach, outputs log
.NOTES
  Version:        1.0
  Author:         Captain Howard
  Creation Date:  12/18/19
  Purpose/Change: Production 

#>

$WindowsCapability = @("Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0",
                        "Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0",
                        "Rsat.DHCP.Tools~~~~0.0.1.0",
                        "Rsat.Dns.Tools~~~~0.0.1.0",
                        "Rsat.FileServices.Tools~~~~0.0.1.0",
                        "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0",
                        "Rsat.IPAM.Client.Tools~~~~0.0.1.0",
                        "Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0",
                        "Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0",
                        "Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0",
                        "Rsat.SystemInsights.Management.Tools~~~~0.0.1.0",
                        "Rsat.WSUS.Tools~~~~0.0.1.0")

#Work in regedit from here
Push-Location
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name DisableWinowsUpdateAccess -Value 0
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 0
Pop-Location

#Ensure that this service has restarted
Restart-Service -Name "Windows Update"

#Bring it back and install everything
foreach ($element in $WindowsCapability) {
    Add-WindowsCapability -Online -Name $element
}
