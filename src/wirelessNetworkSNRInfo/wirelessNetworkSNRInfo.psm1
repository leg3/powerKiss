function wirelessNetworkSNRInfo ($inputPath, $outputPath) {

# load the .netxml file to be processed
[xml]$xml = Get-Content $inputPath 

# Loop through the child nodes of the selected nodes and assemble an object to hold our values.
$xml.'detection-run'.'wireless-network'.'snr-info' | ForEach-Object { 

# Test to see if the row has valid data and build the composite object
if ($_ -ne $NULL) {

# Create the composite object
$wirelessNetworkSNRInfo = New-Object Object

# Get the start time of the data set
$startTime = $xml.'detection-run'.'start-time'

# Get the index of the current row and use it to retrieve the corresponding BSSID value
$index = $xml.'detection-run'.'wireless-network'.'snr-info'.IndexOf($_);
$BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

# Add our values to the composite object
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_dbm" -Value $_.'last_signal_dbm'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_dbm" -Value $_.'last_noise_dbm'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_rssi" -Value $_.'last_signal_rssi'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_rssi" -Value $_.'last_noise_rssi'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_dbm" -Value $_.'min_signal_dbm'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_dbm" -Value $_.'min_noise_dbm'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_rssi" -Value $_.'min_signal_rssi'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_rssi" -Value $_.'min_noise_rssi'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_dbm" -Value $_.'max_signal_dbm'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_dbm" -Value $_.'max_noise_dbm'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_rssi" -Value $_.'max_signal_rssi'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_rssi" -Value $_.'max_noise_rssi'
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "start-time" -Value $startTime
Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "BSSID" -Value $BSSID

# Export a .csv file of the composite object values
$label = ( $inputPath.replace(".netxml","") + "_wirelessNetworkSNRInfo.csv" )
$wirelessNetworkSNRInfo | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

}
}
}