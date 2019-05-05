function wirelessNetworkGPSInfo ($inputPath,$outputPath) {
  # load the .netxml file to be processed
  [xml]$xml = Get-Content $inputPath

  # Loop through the child nodes of the selected nodes and assemble an object to hold our values.
  $xml.'detection-run'.'wireless-network'.'gps-info' | ForEach-Object {

    # Test to see if the row has valid data and build the composite object
    if ($_ -ne $NULL) {

      # Create the wirelessNetworkGPSInfo object
      $wirelessNetworkGPSInfo = New-Object Object

      # Get the start time of the data set
      $startTime = $xml.'detection-run'.'start-time'

      # Get the index of the current row and use it to retrieve the corresponding BSSID value
      $index = $xml.'detection-run'.'wireless-network'.'gps-info'.IndexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

      # Add our values to the composite object
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-lat" -Value $_.'min-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-lon" -Value $_.'min-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-alt" -Value $_.'min-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-spd" -Value $_.'min-spd'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-lat" -Value $_.'max-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-lon" -Value $_.'max-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-alt" -Value $_.'max-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-spd" -Value $_.'max-spd'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-lat" -Value $_.'peak-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-lon" -Value $_.'peak-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-alt" -Value $_.'peak-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-lat" -Value $_.'avg-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-lon" -Value $_.'avg-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-alt" -Value $_.'avg-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "start-time" -Value $startTime
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      # Export a .csv file of the composite object values
      $label = ($inputPath.Replace(".netxml","") + "_wirelessNetworkGPSInfo.csv")
      $wirelessNetworkGPSInfo | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

    }
  }
}
