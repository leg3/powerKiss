function wirelessNetworkSSIDEncryption ($inputPath,$outputPath) {

	# load the .netxml file to be processed
	[xml]$xml = Get-Content $inputPath

	# Get the index of the current row and use it to retrieve the corresponding BSSID value
	$xml.'detection-run'.'wireless-network'.'ssid' | ForEach-Object {

		# Test to see if the row has valid data and build the composite object
		if ($_ -ne $NULL) {

			$index = $xml.'detection-run'.'wireless-network'.'ssid'.IndexOf($_);
			$BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

			# Create the wirelessNetworkSSIDEncryption object
			$xml.'detection-run'.'wireless-network'.'ssid'.'encryption' | ForEach-Object {

				$wirelessNetworkSSIDEncryption = New-Object Object
				$startTime = $xml.'detection-run'.'start-time' # Get the start time value from the root node

				# Define the columns for the object and add the current values for this iteration
				Add-Member -InputObject $wirelessNetworkSSIDEncryption -MemberType NoteProperty -Name "encryption" -Value $_
				Add-Member -InputObject $wirelessNetworkSSIDEncryption -MemberType NoteProperty -Name "BSSID" -Value $BSSID
				Add-Member -InputObject $wirelessNetworkSSIDEncryption -MemberType NoteProperty -Name "start-time" -Value $startTime

				# Create and append the resultant .csv file that will be the wirelessNetworkSSIDEncryption table
				$label = ($inputPath.Replace(".netxml","") + "_wirelessNetworkSSIDEncryption.csv")
				$wirelessNetworkSSIDEncryption | Export-Csv -Path "$outputPath\$label" -Append -NoTypeInformation

			}
		}
	}
}
