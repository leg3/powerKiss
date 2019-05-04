function wirelessClient ($inputPath, $outputPath) {

# load the .netxml file to be processed
[xml]$xml = Get-Content $inputPath 

# Loop through the child nodes of the selected nodes and assemble an object to hold our values.
$xml.'detection-run'.'wireless-network'.'wireless-client' | ForEach-Object {

# Test to see if the row has valid data and build the composite object
if ($_ -ne $NULL) {

# create the wirelessClient object
$wirelessClient = New-Object Object

# Get the start time of the data set
$startTime = $xml.'detection-run'.'start-time'

# Add our values to the composite object
Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-mac" -Value $_.'client-mac'
Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-manuf" -Value $_.'client-manuf'
Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "channel" -Value $_.'channel'
Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "freqmhz-count" -Value $_.'freqmhz'.count
Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "maxseenrate" -Value $_.'maxseenrate'
Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "datasize" -Value $_.'datasize'
Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "start-time" -Value $startTime

# Export a .csv file of the composite object values
$label = ( $inputPath.replace(".netxml","") + "_wirelessClient.csv" )
$wirelessClient | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

}
}
}