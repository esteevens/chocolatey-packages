﻿$ErrorActionPreference = 'Stop'
$toolsPath  = Split-Path $MyInvocation.MyCommand.Definition
$url64      = 'https://github.com/staxrip/staxrip/releases/download/v2.12.0/StaxRip-v2.12.0-x64.7z'
$checksum64 = '24c1c11832a0fbc5770dc6b9f36c65409fbb4efae7cde50898aecc71d847f4a4'

$unzipLocation = New-Item -Path $(Get-ToolsLocation) -Name "StaxRip" -ItemType "directory" -ErrorAction SilentlyContinue -Force

$packageArgs = @{
  PackageName     = $env:ChocolateyPackageName
  UnzipLocation   = $unzipLocation
  Url64bit        = $url64
  Checksum64      = $checksum64
  ChecksumType64  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$desktopPath = [Environment]::GetFolderPath("Desktop")

$subFolder = $url64 -split '/|\.7z' | select -Last 1 -Skip 1

Install-ChocolateyShortcut `
  -ShortcutFilePath "$desktopPath\StaxRip.lnk" `
  -TargetPath "$unzipLocation\$subFolder\StaxRip.exe"

rm $toolsPath\*.7z -ea 0
