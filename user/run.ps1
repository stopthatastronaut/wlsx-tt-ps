param($req, $TriggerMetadata)

$name = $env:WLSX_CANDIDATE_NAME
$token = $env:WLSX_TOKEN

Write-Information "Hello, I am debugging right now"

[pscustomobject]@{
    name = $name;
    token = $token;
} | ConvertTo-Json | Out-File -Encoding Ascii -FilePath $res
