$mod = Get-Content .\trolleyTotal\model.json

Invoke-RestMethod http://localhost:7071/api/trolleytotal -body $mod -ContentType application/json -method post

