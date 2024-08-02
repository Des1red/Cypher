# Ensure Docker is installed
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker could not be found. Please install Docker Desktop first."
    exit 1
}

# Determine the PowerShell profile path
$configFile = $PROFILE

Write-Host "Configuration file set to ${configFile}"

# Create the profile file if it doesn't exist
if (-not (Test-Path -Path $configFile)) {
    New-Item -ItemType File -Path $configFile -Force
    Write-Host "Created profile file at ${configFile}"
}

# Move to the root directory of the project before building the Docker image
cd (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "..")

# Build the Docker image
docker build -t cypher .

# Alias command to be added
$aliasCommand = @"
function cypher {
    param(
        [string[]]$args
    )
    docker run -it --rm --network host --cap-add NET_ADMIN --cap-add NET_RAW cypher @args
}
"@

# Check if the alias already exists in the configuration file to avoid duplication
if (-not (Select-String -Path $configFile -Pattern "function cypher")) {
    Add-Content -Path $configFile -Value $aliasCommand
    . $configFile
    Write-Host "Alias added to ${configFile}:"
    Get-Content $configFile | Select-String -Pattern "function cypher"
} else {
    Write-Host "Alias cypher already exists in ${configFile}"
}

Write-Host "Docker image built and alias 'cypher' set up. You can now run the container using the 'cypher' command."
Write-Host "Please restart your terminal to apply the changes in the current session."
