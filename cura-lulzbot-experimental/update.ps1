import-module au

$releases = 'https://www.lulzbot.com/learn/tutorials/cura-lulzbot-edition-installation-windows'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex = '.exe$'
    $url = $download_page.links | ? href -match $regex | select -First 1 -expand href
	
    $version = ($url -split '_' | select -Last 1 -Skip 1) + '-experimental'
	
    return @{ URL = $url; Version = $version; PackageName = 'cura-lulzbot' }
}

update -ChecksumFor 32
