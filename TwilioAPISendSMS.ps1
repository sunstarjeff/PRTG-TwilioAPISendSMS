# TwilioAPISendSMS.ps1
# PowerShell script to send an outbound SMS using Twilio API with command-line parameters

param (
    [Parameter(Mandatory=$true, HelpMessage="Enter your Twilio Account SID")]
    [string]$AccountSid,

    [Parameter(Mandatory=$true, HelpMessage="Enter your Twilio Auth Token")]
    [string]$AuthToken,

    [Parameter(Mandatory=$true, HelpMessage="Enter your Twilio phone number")]
    [string]$FromNumber,

    [Parameter(Mandatory=$true, HelpMessage="Enter your destination mobile phone number")]
    [string]$ToNumber,

    [Parameter(Mandatory=$true, HelpMessage="Hello from PowerShell! This is a test SMS sent via Twilio.")]
    [string]$MessageBody
)

# Twilio API endpoint for sending messages
$uri = "https://api.twilio.com/2010-04-01/Accounts/$AccountSid/Messages.json"

# Create a credential object for HTTP Basic Authentication
$secureToken = ConvertTo-SecureString $AuthToken -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($AccountSid, $secureToken)

# Define POST parameters
$params = @{
    To   = $ToNumber
    From = $FromNumber
    Body = $MessageBody
}

try {
    # Make the POST request to Twilio API
    $response = Invoke-WebRequest -Uri $uri -Method Post -Credential $credential -Body $params -UseBasicParsing

    # Parse JSON response and extract relevant properties
    $result = $response.Content | ConvertFrom-Json

    # Output the message SID and body for confirmation
    Write-Output "SMS sent successfully!"
    Write-Output "Message SID: $($result.sid)"
    Write-Output "Message Body: $($result.body)"
}
catch {
    # Handle errors
    Write-Error "Failed to send SMS. Error: $($_.Exception.Message)"
    if ($_.Exception.Response) {
        $errorResponse = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($errorResponse)
        $errorDetails = $reader.ReadToEnd()
        Write-Error "Error Details: $errorDetails"
    }
}
