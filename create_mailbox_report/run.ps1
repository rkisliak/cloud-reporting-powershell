using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

Write-Output "PowerShell HTTP trigger function processed a request."

# Parse the request body for JSON payload
$requestBody = Get-Content -Raw -InputObject $Request.Body | ConvertFrom-Json

# Retrieve run_id, customer_id, and tenant_id from the request body
$run_id = $requestBody.run_id
$customer_id = $requestBody.customer_id
$tenant_id = $requestBody.tenant_id

# Validate the required parameters
if (-not $run_id -or -not $customer_id -or -not $tenant_id) {
    Write-Output "Missing required parameters run_id, customer_id, or tenant_id."
    $status = [HttpStatusCode]::BadRequest
    $body = @{
        error = "Please provide run_id, customer_id, and tenant_id in the request body."
    } | ConvertTo-Json
    Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = $status
        Body = $body
    })
    return
}

# Process the request (add your actual logic here)
Write-Output "Processing PowerShell function for run_id: $run_id, customer_id: $customer_id, tenant_id: $tenant_id"

# Placeholder for actual processing logic
# ...

# Return success response
$status = [HttpStatusCode]::OK
$body = @{
    message = "PowerShell function executed successfully"
} | ConvertTo-Json
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $status
    Body = $body
})
