﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\LyX-2351-Installer-3.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
