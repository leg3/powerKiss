function detectionRun ($inputPath, $outputPath) {

# load the .netxml file to be processed
[xml]$xml = Get-Content $inputPath 

# Loop through the child nodes of the selected nodes and assemble an object to hold our values.
$xml.'detection-run'[1] | ForEach-Object { #NOTE only selecting from index 1 as index 0 returns a blank result!

# Test to see if the row has valid data and build the composite object
if ($_ -ne $NULL) {

# create the detectionRun object
$detectionRun = New-Object Object

# Add our values to the composite object
Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "kismet-version" -Value $_.'kismet-version'
Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "start-time" -Value $_.'start-time'

# Export a .csv file of the composite object values
$label = ( $inputPath.replace(".netxml","") + "_detectionRun.csv" )
$detectionRun | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

}
}
}