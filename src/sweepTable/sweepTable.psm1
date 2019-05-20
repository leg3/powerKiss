function sweepTable {

Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {
        
# Create directories named after the .netxml files
$name = $_.Replace(".netxml","")
mkdir $name
        
# Get config template from github and store it in a variable
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$template = Invoke-RestMethod -Uri https://gist.githubusercontent.com/velvet-valdes/bda8b133d761e7543fed60b6e9f8bde0/raw/24ce33ff84f1ace741bd16b66c5c19f0d6ea69a0/loaderTemplate.sql

# Replace the needed strings in the file

$template = $template.replace("cardSource.csv",("$name"+"_cardSource.csv"))
$template = $template.replace("detectionRun.csv",("$name"+"_detectionRun.csv"))
$template = $template.replace("wirelessClient.csv",("$name"+"_wirelessClient.csv"))
$template = $template.replace("wirelessClientGPSInfo.csv",("$name"+"_wirelessClientGPSInfo.csv"))
$template = $template.replace("wirelessClientPackets.csv",("$name"+"_wirelessClientPackets.csv"))
$template = $template.replace("wirelessClientSeenCard.csv",("$name"+"_wirelessClientSeenCard.csv"))
$template = $template.replace("wirelessClientSNRInfo.csv",("$name"+"_wirelessClientSNRInfo.csv"))
$template = $template.replace("wirelessNetwork.csv",("$name"+"_wirelessNetwork.csv"))
$template = $template.replace("wirelessNetworkFreqMHZ.csv",("$name"+"_wirelessNetworkFreqMHZ.csv"))
$template = $template.replace("wirelessNetworkGPSInfo.csv",("$name"+"_wirelessNetworkGPSInfo.csv"))
$template = $template.replace("wirelessNetworkPackets.csv",("$name"+"_wirelessNetworkPackets.csv"))
$template = $template.replace("wirelessNetworkSeenCard.csv",("$name"+"_wirelessNetworkSeenCard.csv"))
$template = $template.replace("wirelessNetworkSNRInfo.csv",("$name"+"_wirelessNetworkSNRInfo.csv"))
$template = $template.replace("wirelessNetworkSSID.csv",("$name"+"_wirelessNetworkSSID.csv"))
$template = $template.replace("wirelessNetworkSSIDEncryption.csv",("$name"+"_wirelessNetworkSSIDEncryption.csv"))
# Export the .sql statement file used to load the .csv into the database
$loaderName = ".\" + "$name" + ".sql"
$template | Out-File $loaderName 

# Move the processed files into their respective folders
$destination = Get-ChildItem -Path ./ -Directory $name
Move-Item -Path ".\$name*.csv" -Destination $destination
Move-Item -Path ".\$name*.sql" -Destination $destination
       
}
    
}
