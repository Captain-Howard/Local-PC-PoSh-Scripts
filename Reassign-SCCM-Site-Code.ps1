<#
.SYNOPSIS
  Sets SCCM Site Code. 
.DESCRIPTION
  Checks for the SCCM site code against $DesiredSiteCode , if no match it will remove hardcoded registry values, reassign the client, and log results.  
.NOTES
  Version:        2.0
  Author:         Captain Howard
  Creation Date:  12/18/19
  Purpose/Change: Production 

#>

$DesiredSiteCode = "sitecode"

$smsClient = New-Object -ComObject "Microsoft.SMS.Client"
$Result = $smsClient.GetAssignedSite()

if ($Result -eq $DesiredSiteCode){Exit} 

Else { 
push-location
$registryPath = 'HKLM:\SOFTWARE\Microsoft\SMS\Mobile Client'

    If (Get-ItemProperty -Path $registryPath -Name GPRequestedSiteAssignmentCode -ErrorAction SilentlyContinue -OutVariable outvar) 

        {   #Cleans hardcoded SiteCode entries from the registry if found
            Get-Item -Path $registryPath | Remove-ItemProperty -Name 'GPRequestedSiteAssignmentCode' -Force -ErrorAction SilentlyContinue
            Get-Item -Path $registryPath | Remove-ItemProperty -Name 'GPSiteAssignmentRetryInterval(Min)' -Force -ErrorAction SilentlyContinue
            Get-Item -Path $registryPath | Remove-ItemProperty -Name 'GPSiteAssignmentRetryDuration(Hour)' -Force -ErrorAction SilentlyContinue
            $RegistryRemediated = 'TRUE'
        }
 
    Else {$RegistryRemediated = 'FALSE'}
pop-location
$smsClient.SetAssignedSite("PS1")
}
