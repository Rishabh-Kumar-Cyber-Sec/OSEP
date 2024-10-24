Add-Type @"
using System;
using System.Runtime.InteropServices;

public class UserName
{
    [DllImport("advapi32.dll", CharSet = CharSet.Ansi)]
    public static extern bool GetUserNameA(byte[] lpBuffer, ref uint pcbBuffer);
}
"@


$bufferSize = 256
$buffer = New-Object byte[] $bufferSize


if ([UserName]::GetUserNameA($buffer, [ref]$bufferSize)) {

    $userName = [System.Text.Encoding]::ASCII.GetString($buffer, 0, $bufferSize)

    $userName = $userName.TrimEnd([char]0)
    Write-Host "User Name: $userName"
} else {
    Write-Host "Failed to get the user name."
}

