Write-Information "Hello, I am debugging right now"

[pscustomobject]@{
    name = $name;
    token = $token;
} | ConvertTo-Json | Out-File -Encoding Ascii -FilePath $res
