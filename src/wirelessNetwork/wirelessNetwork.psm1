function wirelessNetwork ($inputPath, $outputPath) {

# load the .netxml file to be processed
[xml]$xml = Get-Content $inputPath 

# Loop through the child nodes of the selected nodes and assemble an object to hold our values.
$xml.'detection-run'.'wireless-network' | ForEach-Object {

# Test to see if the row has valid data and build the composite object
if ($_ -ne $NULL) {

# Create the wirelessNetworkObject
$wirelessNetwork = New-Object Object

# Get the start time of the data set
$startTime = $xml.'detection-run'.'start-time'

# Add our values to the composite object
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bssid" -Value $_.'BSSID'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "manuf" -Value $_.'manuf'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "channel" -Value $_.'channel'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "freqmhz-count" -Value $_.'freqmhz'.count
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "maxseenrate" -Value $_.'maxseenrate'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "datasize" -Value $_.'datasize'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bsstimestamp" -Value $_.'bsstimestamp'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-device" -Value $_.'cdp-device'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-portid" -Value $_.'cdp-portid'
Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "start-time" -Value $startTime

# Export a .csv file of the composite object values
$label = ( $inputPath.replace(".netxml","") + "_wirelessNetwork.csv" )
$wirelessNetwork | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

}
}
}