$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://files.mcneel.com/dujour/exe/20191022/rhino_en-us_6.19.19295.01001.exe'
$checksum   = '99912a024c669fc1d9c6cfb289e5a1469f9a785f20073b5fc0f6314db2924362'
$silentArgs = '-package -quiet -norestart'

$pp   = Get-PackageParameters # Reference: https://wiki.mcneel.com/rhino/installingrhino/6
if (!$pp['ENABLE_AUTOMATIC_UPDATES'])
{
  $pp['ENABLE_AUTOMATIC_UPDATES'] = '0'
}

foreach($p in $pp.keys)
{
  if($pp.$p.length -lt 1){ continue }
  $silentArgs += " {0}={1}" -f $p, $pp.$p
}
Write-Host "installer cmd arguments: $silentArgs"

$args = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'rhino6*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
  validExitCodes= @(0)
}

Install-ChocolateyPackage @args # https://chocolatey.org/docs/helpers-install-chocolatey-package