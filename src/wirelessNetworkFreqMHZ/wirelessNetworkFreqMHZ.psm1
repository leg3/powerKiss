function wirelessNetworkFreqMHZ ($inputPath,$outputPath) {

  # load the .netxml file to be processed
  [xml]$xml = Get-Content $inputPath

  # Loop through the child nodes of the selected nodes and assemble an object to hold our values.
  $xml.'detection-run'.'wireless-network' | ForEach-Object {

    # Get the index of the current row and use it to retrieve the corresponding BSSID value
    $index = $xml.'detection-run'.'wireless-network'.IndexOf($_);
    $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

    # Loop through the child nodes of the selected nodes and assemble an object to hold our values.
    $xml.'detection-run'.'wireless-network'.'freqmhz' | ForEach-Object {

      # Create the wirelessNetworkFreqMHZ object
      $wirelessNetworkFreqMHZ = New-Object Object

      # Get the start time of the data set
      $startTime = $xml.'detection-run'.'start-time'

      # Add our values to the composite object
      Add-Member -InputObject $wirelessNetworkFreqMHZ -MemberType NoteProperty -Name "freqmhz" -Value $_
      Add-Member -InputObject $wirelessNetworkFreqMHZ -MemberType NoteProperty -Name "bssid" -Value $BSSID
      Add-Member -InputObject $wirelessNetworkFreqMHZ -MemberType NoteProperty -Name "start-time" -Value $startTime

      # Export a .csv file of the composite object values
      $label = ($inputPath.Replace(".netxml","") + "_wirelessNetworkFreqMHZ.csv")
      $wirelessNetworkFreqMHZ | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

    }
  }
}

