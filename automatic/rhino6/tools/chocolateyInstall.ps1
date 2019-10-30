$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://files.mcneel.com/dujour/exe/20191022/rhino_en-us_6.19.19295.01001.exe'
$checksum   = '99912a024c669fc1d9c6cfb289e5a1469f9a785f20073b5fc0f6314db2924362'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'rhino6*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = '-package -quiet -norestart'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package