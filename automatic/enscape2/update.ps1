Import-Module au

$url = 'https://api2.enscape3d.com/v2/Release/installers/website/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"       = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $regex = 'VersionString"\s*:\s*"(\d+\.\d+\.*\d*).*".+"InstallPath"\s*:\s*"(.+\.msi)"'
    $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing
    $result = $download_page  | Select-String -Pattern $regex

    $url = $result.Matches.Groups[2].Value
    $url = "https://installer.enscape.io/$url"

    $Latest = @{
        URL     = $url
        Version = $result.Matches.Groups[1].Value
    }
    return $Latest
}

update -NoCheckUrl -ChecksumFor 32