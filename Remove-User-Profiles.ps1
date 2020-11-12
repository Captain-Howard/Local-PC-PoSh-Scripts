Get-WMIObject -class Win32_UserProfile | Where-Object {($_.Special -ne "True") -and ($_.LastUseTime -lt (Get-Date).AddDays(-5))} | Remove-WMIObject
