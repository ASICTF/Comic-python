<# :
cls
@echo off
rem Delete the last picture in multiple subfolders respectively
title %#% +%$%%$%/%@% %z%
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy bypass "Invoke-Command -ScriptBlock ([ScriptBlock]::Create([IO.File]::ReadAllText('%~f0',[Text.Encoding]::Default))) -Args '%~dp0'"
echo;%#% +%$%%$%/%@% %z%
pause
exit
#>
$path=$args[0].trimend('\');
$codes=@'
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
public static class ExpDir
{
[DllImport("Shlwapi.dll", CharSet=CharSet.Unicode)]
public static extern int StrCmpLogicalW(string p1, string p2);
public static string[] Sort(string[] f)
{
Array.Sort(f, StrCmpLogicalW);
return f;
}
}
'@;
Add-Type -TypeDefinition $codes;
$folders=@(dir -liter $path|?{$_ -is [System.IO.DirectoryInfo]});
for($i=0;$i -lt $folders.length;$i++){
$files=@(dir -liter $folders[$i].FullName|?{$_ -is [System.IO.FileInfo]});
$filesname=@($files|?{@('.jpg','.jpeg','.png','.bmp','.gif','.tif') -contains $_.Extension}|%{$_.Name});
if($filesname.length -ge 1){
$list=[ExpDir]::Sort($filesname);
$f=$folders[$i].Name+'\'+$list[-1];
Remove-Item -Verbose $f;
};
};
