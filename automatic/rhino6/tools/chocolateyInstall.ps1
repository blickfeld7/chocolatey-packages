$ErrorActionPreference = 'Stop'

$url         = ''
$checksum    = ''

$packageArgs = @{
    packageName     = 'rhino6'
    installerType   = 'exe'
    silentArgs        = '/VERYSILENT'
    url             = $url
}

Install-ChocolateyPackage @packageArgs