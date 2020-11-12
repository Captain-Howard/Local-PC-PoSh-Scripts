$screensaver_remote_path = "\\remote\path\screensaver.jpg"
$screensaver_local_path = "C:\ITDept\ScreenSaver\"
$errorlog = "C:\ITDept\screensaver-copy-errorlog_$(get-date -format `"yyyyMMdd_hhmm`").txt"

try {
    #First things first: Delete the content of the destination
    remove-item -Path ($screensaver_local_path + '*.*')
    #Next: copy file from remote to destination
    copy-item -Path $screensaver_remote_path -Destination $screensaver_local_path
}
catch [System.Management.Automation.Remoting.PSRemotingTransportException]{
    $_.Exception.Message | out-file -FilePath $errorlog
}
