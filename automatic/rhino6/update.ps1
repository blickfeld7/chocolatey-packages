import-module au

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
    while($true) {
        $request = [System.Net.WebRequest]::Create($url)
        $request.AllowAutoRedirect=$false
        $response=$request.GetResponse()
        $location = $response.GetResponseHeader('Location')
        if (!$location -or ($location -eq $url)) { break }
        $url = $location
    }

    $version = ($url -split '-|\.' | Select-Object -Last 4 -skip 2) -join '.'
    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -NoCheckUrl -ChecksumFor 32
