$RemoteAssociationLocation = "\\remote\server\defaultassociations.xml"
$LocalAssociationLocation = "C:\Windows\System32\defaultassociations.xml"

Copy-Item $RemoteAssociationLocation -Destination $LocalAssociationLocation -Force
