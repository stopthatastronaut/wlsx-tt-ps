$baseurl = $env:WLSX_BASE_URL # employer endpoint

Invoke-Restmethod https://wlsx-tt-ps.azurewebsites.net/api/user


Invoke-WebRequest https://wlsx-tt-ps.azurewebsites.net/api/user

irm  https://wlsx-tt-ps.azurewebsites.net/api/sort?sortOption=Descending

irm  http://localhost:7071/api/sort?sortOption=Low
irm  http://localhost:7071/api/sort?sortOption=High
irm  http://localhost:7071/api/sort?sortOption=Ascending
irm  http://localhost:7071/api/sort?sortOption=Recommended

$body = [pscustomobject]@{
    url = 'https://wlsx-tt-ps.azurewebsites.net/api'
    token = $env:WLSX_TOKEN
}

$ex1 = "$baseurl/api/Exercise/Exercise1"

Invoke-Restmethod $ex1 -method POST -body ($body | ConvertTo-Json) -ContentType 'application/json'


$ex2 = "$baseurl/api/Exercise/Exercise2"

Invoke-Restmethod $ex2 -method POST -body ($body | ConvertTo-Json) -ContentType 'application/json'


$ex3 = "$baseurl/api/Exercise/Exercise3"

Invoke-Restmethod $ex3 -method POST -body ($body | ConvertTo-Json) -ContentType 'application/json'

