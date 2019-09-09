# POST method: $req
$requestBody = Get-Content $req -Raw | ConvertFrom-Json
$name = $env:WLSX_CANDIDATE_NAME
$token = $env:WLSX_TOKEN

# GET method: each querystring parameter is its own variable
if ($req_query_name)
{
    $name = $req_query_name
}

Write-Information "Hello, I am debugging right now"

[pscustomobject]@{
    name = $name;
    token = $token;
} | ConvertTo-Json | Out-File -Encoding Ascii -FilePath $res
