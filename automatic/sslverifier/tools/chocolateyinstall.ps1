$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\SSLVerifier-v1.3.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$OSArchitectureWidth = Get-OSArchitectureWidth
$shortcutFilePath = Join-Path $programs "SSLVerifier.lnk"
$targetPath = Join-Path $toolsDir "SSLVerifier-x$OSArchitectureWidth"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath