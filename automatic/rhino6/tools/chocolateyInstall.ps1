$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://files.mcneel.com/dujour/exe/20191022/rhino_en-us_6.19.19295.01001.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
  url           = $url
  softwareName  = 'rhino6*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '99912a024c669fc1d9c6cfb289e5a1469f9a785f20073b5fc0f6314db2924362'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  silentArgs    = '-package -quiet -passive -norestart'      # NSIS
  validExitCodes= @(0) #please insert other valid exit codes here
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package