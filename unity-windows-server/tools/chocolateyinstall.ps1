﻿$ErrorActionPreference = 'Stop';

$url64          = 'https://download.unity3d.com/download_unity/c9714fde33b6/TargetSupportInstaller/UnitySetup-Windows-Server-Support-for-Editor-2021.3.19f1.exe'
$checksum64     = '7c77f66edec6283c173f29b61d69c809e8dfa7d29775068f9f1b59650b4b269a'

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
