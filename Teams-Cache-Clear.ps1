<#
.SYNOPSIS
  Clears Teams Cache
.DESCRIPTION
  For some reason Teams has been having issues with too much information building up in the cache lately... This clears all Teams cache locations. 
.NOTES
  Version:        1.0
  Author:         Captain Howard
  Creation Date:  12/18/19
  Purpose/Change: Production 
#>

#Initialization
$list_of_filepaths = @()

#Step 1: Close Teams
Stop-Process -ProcessName Teams

#Step 2-3: Finding folders and deleting files
#Step 3 a) Application Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\application cache\cache"
#Step 3 b) Blob_storage Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\blob_storage"
#Step 3 c) Cache Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\Cache"
#Step 3 d) databases Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\databases"
#Step 3 e) GPUCache Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\GPUcache"
#Step 3 f) IndexedDB Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\IndexedDB"
#Step 3 g) Local Storage Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\Local Storage"
#Step 3 h) tmp Cache
$list_of_filepaths += "$Env:USERPROFILE\AppData\Roaming\Microsoft\Teams\tmp"

#Lastly go through all and delete all files
foreach($filepath in $list_of_filepaths){
    Remove-Item -Path $filepath -Include *.* -Recurse
}
