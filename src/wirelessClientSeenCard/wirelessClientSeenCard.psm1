function wirelessClientSeenCard ($inputPath,$outputPath) {

  # load the .netxml file to be processed
  [xml]$xml = Get-Content $inputPath

  # Loop through the child nodes of the selected nodes and assemble an object to hold our values.
  $xml.'detection-run'.'wireless-network'.'wireless-client'.'seen-card' | ForEach-Object {

    # Test to see if the row has valid data and build the composite object
    if ($_ -ne $NULL) {

      # Create wirelessClientSeenCard object
      $wirelessClientSeenCard = New-Object Object

      # Get the start time of the data set
      $startTime = $xml.'detection-run'.'start-time'

      # Add our values to the composite object
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'seen-uuid'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'seen-time'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'seen-packets'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "start-time" -Value $startTime

      # Export a .csv file of the composite object values
      $label = ($inputPath.Replace(".netxml","") + "_wirelessClientSeenCard.csv")
      $wirelessClientSeenCard | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

    }
  }
}



