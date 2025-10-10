function Shorten-Url {
    [CmdletBinding()]
    $url = Read-Host -Prompt "Enter the URL to shorten"
    $apikey = "http://tinyurl.com/api-create.php?url=$url"

    try {
        $Final = Invoke-RestMethod -Uri $apikey
        Write-Host "Shortened URL: $Final"
    }
    catch {
        Write-Error "Failed to shorten URL: $_"
    }
}