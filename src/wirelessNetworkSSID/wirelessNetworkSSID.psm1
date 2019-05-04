function wirelessNetworkSSID ($inputPath,$outputPath) {

  # load the .netxml file to be processed
  [xml]$xml = Get-Content $inputPath

  # Loop through the child nodes of the selected nodes and assemble an object to hold our values.
  $xml.'detection-run'.'wireless-network'.'ssid' | ForEach-Object {

    # Test to see if the row has valid data and build the composite object
    if ($_ -ne $NULL) {

      # Create the composite object
      $wirelessNetworkSSID = New-Object Object

      # Get the start time of the data set
      $startTime = $xml.'detection-run'.'start-time'

      # Get the index of the current row and use it to retrieve the corresponding BSSID value
      $index = $xml.'detection-run'.'wireless-network'.'ssid'.IndexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

      # Add our values to the composite object
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "type" -Value $_.'type'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "max-rate" -Value $_.'max-rate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "packets" -Value $_.'packets'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "beaconrate" -Value $_.'beaconrate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wps" -Value $_.'wps'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "encryption-count" -Value $_.'encryption'.count
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wpa_version" -Value $_.'wpa-version'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "cloaked" -Value $_.'essid'.'cloaked'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "essid" -Value $_.'essid'.'#text'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "start-time" -Value $startTime
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      # Export a .csv file of the composite object values
      $label = ($inputPath.Replace(".netxml","") + "_wirelessNetworkSSID.csv")
      $wirelessNetworkSSID | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

    }
  }
}
