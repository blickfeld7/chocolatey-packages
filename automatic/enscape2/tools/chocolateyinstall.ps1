$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://installer.enscape.io/Enscape-2.6.0%2B11215.msi'
$checksum   = 'b22c0aacb62c5b1c2f2fe3d86da22a86291c2085aa5339470efb1fb856876bc7'
$silentArgs = '/quiet'

$pp   = Get-PackageParameters # Reference: https://wiki.mcneel.com/rhino/installingrhino/6
if (!$pp['ACCEPTEULA']){ $pp['ACCEPTEULA'] = '1' }
if (!$pp['SKIPREQUIREMENTS']){ $pp['SKIPREQUIREMENTS'] = '1' }
if (!$pp['ALLUSERS']){ $pp['ALLUSERS'] = '1' }
if (!$pp['INSTALLLEVEL']){ $pp['INSTALLLEVEL'] = '1' }

# concatenate silent arguments
foreach($p in $pp.keys)
{
  if($pp.$p.length -lt 1){ continue }
  $silentArgs += " {0}={1}" -f $p, $pp.$p
}
$silentArgs += " /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
Write-Host "installer cmd arguments: $silentArgs"

$packageArgs = @{
  packageName   = 'enscape2'
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  softwareName  = 'enscape2*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = $silentArgs # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs