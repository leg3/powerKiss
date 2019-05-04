function wirelessClientPackets ($inputPath, $outputPath) {

# load the .netxml file to be processed
[xml]$xml = Get-Content $inputPath 

# Loop through the child nodes of the selected nodes and assemble an object to hold our values.
$xml.'detection-run'.'wireless-network'.'wireless-client'.'packets' | ForEach-Object {

# Test to see if the row has valid data and build the composite object
if ($_ -ne $NULL) {

# Create the wirelessClientPackets object
$wirelessClientPackets = New-Object Object

# Get the start time of the data set
$startTime = $xml.'detection-run'.'start-time'

# Get the index of the current row and use it to retrieve the corresponding BSSID value
$index = $xml.'detection-run'.'wireless-network'.'wireless-client'.'packets'.IndexOf($_);
$clientMAC = $xml.'detection-run'.'wireless-network'.'wireless-client'.'client-mac'[$index]

# Add our values to the composite object
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "llc" -Value $_.'llc'
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "data" -Value $_.'data'
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "crypt" -Value $_.'crypt'
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "total" -Value $_.'total'
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "fragments" -Value $_.'fragments'
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "retries" -Value $_.'retries'
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "start-time" -Value $startTime
Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "client-mac" -Value $clientMAC

# Export a .csv file of the composite object values
$label = ( $inputPath.replace(".netxml","") + "_wirelessClientPackets.csv" )
$wirelessClientPackets | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

}
}
}