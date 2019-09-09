using namespace System.Net

param($req, $TriggerMetadata)

# POST method: $req
# $requestBody = Get-Content $req -Raw | ConvertFrom-Json

Function Sort-ByRecommended
{
    [CmdletBinding()]
    param(
        $products
    )

    $shopperHistoryUri = $env:WLSX_BASE_URL + "/api/resource/shopperHistory?token=" + $env:WLSX_TOKEN

    $history = irm $shopperHistoryUri -Headers @{accept = "application/json"}
    $counts = $history | select -expand products | Group-Object -Property  name

    $products | % {
        $productname = $_.Name
        $pop = $counts | ? { $_.Name -eq $productname } | select -expand Count
        if($null -eq $pop) { $pop = 0 }
        $_ | Add-Member -name Popularity -Value $pop -MemberType NoteProperty
    }

    $products | Sort -Property Popularity -Descending | Select name, price, quantity

}

$productsuri = $env:WLSX_BASE_URL + "/api/resource/products?token=" + $env:WLSX_TOKEN

$products = Invoke-Restmethod -uri $productsuri -Headers @{accept = "application/json"}

# GET method: each querystring parameter is its own variable
if($req_query_sortOption)
{
    $sortoption = $req_query_sortOption
}

switch($sortoption)
{
    "Ascending" {
        $sorted = $products | Sort-Object -Property name
    }
    "Descending" {
        $sorted = $products | Sort-Object -Property Name -descending
    }
    "Low" {
        $sorted = $products | Sort-Object -Property Price
    }
    "High" {
        $sorted = $products | Sort-Object -Property Price -descending
    }
    "Recommended" {
        $sorted = Sort-ByRecommended -products $products
    }
    default {
        $sorted = $products
    }
}

$body = $sorted | ConvertTo-Json


$status = [HttpStatusCode]::OK
Push-OutputBinding -Name Res -Value ([HttpResponseContext]@{
    StatusCode = $status
    Body = $body
})
