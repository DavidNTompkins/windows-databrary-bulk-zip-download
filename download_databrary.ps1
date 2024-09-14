# Check if a CSV file and volume number are provided
param(
    [Parameter(Mandatory=$true)]
    [string]$CsvFilePath,

    [Parameter(Mandatory=$true)]
    [int]$VolumeNumber
)

# Check if the CSV file exists
if (-not (Test-Path $CsvFilePath)) {
    Write-Host "Error: CSV file not found: $CsvFilePath"
    exit 1
}

# Path to Chrome executable (update this if your Chrome is installed in a different location)
$ChromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Check if Chrome exists at the specified path
if (-not (Test-Path $ChromePath)) {
    Write-Host "Error: Chrome executable not found at $ChromePath"
    Write-Host "Please update the `$ChromePath variable in the script with the correct path to chrome.exe"
    exit 1
}

# Read the CSV file and open Chrome for each session ID
Import-Csv $CsvFilePath | ForEach-Object {
    $sessionId = $_.'session-id'
    $sessionName = $_.'session-name'
    $url = "https://nyu.databrary.org/volume/$VolumeNumber/slot/$sessionId/zip/false"
    
    Write-Host "Opening URL for session $sessionId`: $sessionName"
    Start-Process $ChromePath -ArgumentList $url
    
    # Wait for 3 minutes before opening the next window
    Start-Sleep -Seconds 180
}

Write-Host "All URLs have been opened in Chrome."