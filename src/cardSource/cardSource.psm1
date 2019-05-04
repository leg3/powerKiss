function cardSource ($inputPath,$outputPath) {

  # load the .netxml file to be processed
  [xml]$xml = Get-Content $inputPath

  # Loop through the child nodes of the selected nodes and assemble an object to hold our values.
  $xml.'detection-run'.'card-source' | ForEach-Object {

    # Test to see if the row has valid data and build the composite object
    if ($_ -ne $NULL) {

      # Create the card-source object.
      $cardSouce = New-Object Object

      # Get the start time of the data set
      $startTime = $xml.'detection-run'.'start-time'

      # Add our values to the composite object
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-source" -Value $_.'card-source'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-name" -Value $_.'card-name'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-interface" -Value $_.'card-interace'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-type" -Value $_.'card-type'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-packets" -Value $_.'card-packets'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-hop" -Value $_.'card-hop'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-channels" -Value $_.'card-channels'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "start-time" -Value $startTime

      # Export a .csv file of the composite object values
      $label = ($inputPath.Replace(".netxml","") + "_cardSource.csv")
      $cardSouce | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

    }
  }
}
