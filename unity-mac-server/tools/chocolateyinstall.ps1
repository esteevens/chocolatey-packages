﻿$ErrorActionPreference = 'Stop';

$url64          = 'https://download.unity3d.com/download_unity/9e7d58001ecf/TargetSupportInstaller/UnitySetup-Mac-Server-Support-for-Editor-2021.3.13f1.exe'
$checksum64     = '78cb50f821ad958e46c72b36af03d6228ba100855cf1f3115335644b5c18222e'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
