Import-Module au

$url = 'https://www2.mcneel.com/updates/06bb1079-5a56-47a1-ad6d-0b45183d894b/release/win64/en-us/stable'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"       = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing
    $regex   = '.exe$'
    $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
    $version = $url -split '_|.exe' | Select-Object -Last 1 -Skip 1
    
    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -NoCheckUrl -ChecksumFor 32