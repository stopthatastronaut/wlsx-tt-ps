using namespace System.Net

# Input bindings are passed in via param block.
param($Req, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$trolley = $Req.Body
if (-not $trolley) {
    throw "No trolley posted"
}
else {
    $trolley.GetType() # this should be a hashtable/psobject
    $trolley | ConvertTo-Json -depth 6
}

$productPrices = $trolley.products
$specialPrices = $trolley.specials
$contents = $trolley.quantities

FUnction Test-SpecialApplies
{
    param($product, $quantity)

    return (
        $specialPrices
    )


}

# loop through contents

$contents | % {

    # see if this product has a special where the quantity is -lte what we have in the trolley





}






$Body = "10"

# Associate values to output bindings by calling 'Push-OutputBinding'.
$status = [HttpStatusCode]::OK
Push-OutputBinding -Name Res -Value ([HttpResponseContext]@{
    StatusCode = $status
    Body = $body
})
