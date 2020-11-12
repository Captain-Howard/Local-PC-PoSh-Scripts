<#
.SYNOPSIS
  ADV200001 WorkAround
.DESCRIPTION
   This restricts access to JScript.dll as per Security Advisory on the Microsoft Guidance on Scripting Engine Memory Corruption Vulnerability
.NOTES
  Version:        1.0
  Author:         Captain Howard
  Creation Date:  1/22/2020
  Purpose/Change: Production 
#>

if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
{
    cmd.exe /c "takeown /f %windir%\system32\jscript.dll"
    cmd.exe /c "cacls %windir%\system32\jscript.dll /E /P everyone:N"
    cmd.exe /c "takeown /f %windir%\syswow64\jscript.dll"
    cmd.exe /c "cacls %windir%\syswow64\jscript.dll /E /P everyone:N"   
}
else
{
    cmd.exe /c "takeown /f %windir%\system32\jscript.dll"
    cmd.exe /c "cacls %windir%\system32\jscript.dll /E /P everyone:N"
}
