function wirelessClientGPSInfo ($inputPath,$outputPath) {

  # load the .netxml file to be processed
  [xml]$xml = Get-Content $inputPath

  # Loop through the child nodes of the selected nodes and assemble an object to hold our values.
  $xml.'detection-run'.'wireless-network'.'wireless-client'.'gps-info' | ForEach-Object {

    # Test to see if the row has valid data and build the composite object
    if ($_ -ne $NULL) {

      # Create the wirelessClientGPSInfo object
      $wirelessClientGPSInfo = New-Object Object

      # Get the start time of the data set
      $startTime = $xml.'detection-run'.'start-time'

      # Get the index of the current row and use it to retrieve the corresponding BSSID value
      $index = $xml.'detection-run'.'wireless-network'.'wireless-client'.'gps-info'.IndexOf($_);
      $clientMAC = $xml.'detection-run'.'wireless-network'.'wireless-client'.'client-mac'[$index]

      # Add our values to the composite object
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-lat" -Value $_.'min-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-lon" -Value $_.'min-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-alt" -Value $_.'min-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-spd" -Value $_.'min-spd'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-lat" -Value $_.'max-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-lon" -Value $_.'max-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-alt" -Value $_.'max-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-spd" -Value $_.'max-spd'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lat" -Value $_.'peak-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lon" -Value $_.'peak-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-alt" -Value $_.'peak-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lat" -Value $_.'avg-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lon" -Value $_.'avg-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-alt" -Value $_.'avg-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "start-time" -Value $startTime
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "client-mac" -Value $clientMAC

      # Export a .csv file of the composite object values
      $label = ($inputPath.Replace(".netxml","") + "_wirelessClientGPSInfo.csv")
      $wirelessClientGPSInfo | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

    }
  }
}
