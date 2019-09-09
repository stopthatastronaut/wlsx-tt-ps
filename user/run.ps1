using namespace System.Net

param($req, $TriggerMetadata)

$name = $env:WLSX_CANDIDATE_NAME
$token = $env:WLSX_TOKEN

Write-Host "Hello, I am debugging right now"

$body = [pscustomobject]@{
    name = $name;
    token = $token;
} | ConvertTo-Json

$status = [HttpStatusCode]::OK

Push-OutputBinding -Name Res -Value ([HttpResponseContext]@{
    StatusCode = $status
    Body = $body
})
