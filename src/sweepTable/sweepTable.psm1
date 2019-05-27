function sweepTable {

	Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

		# Create directories named after the .netxml files
		$name = $_.Replace(".netxml","")
		mkdir $name

		# Get config template from github and store it in a variable
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		$template = Invoke-RestMethod -Uri https://gist.githubusercontent.com/velvet-valdes/bda8b133d761e7543fed60b6e9f8bde0/raw/9f8fb07700e942078324c2432010194dcd0e70f7/loaderTemplate.sql

		# Replace the needed strings in the file
		$template = $template.Replace("cardSource.csv",("$name" + "_cardSource.csv"))
		$template = $template.Replace("detectionRun.csv",("$name" + "_detectionRun.csv"))
		$template = $template.Replace("wirelessClient.csv",("$name" + "_wirelessClient.csv"))
		$template = $template.Replace("wirelessClientGPSInfo.csv",("$name" + "_wirelessClientGPSInfo.csv"))
		$template = $template.Replace("wirelessClientPackets.csv",("$name" + "_wirelessClientPackets.csv"))
		$template = $template.Replace("wirelessClientSeenCard.csv",("$name" + "_wirelessClientSeenCard.csv"))
		$template = $template.Replace("wirelessClientSNRInfo.csv",("$name" + "_wirelessClientSNRInfo.csv"))
		$template = $template.Replace("wirelessNetwork.csv",("$name" + "_wirelessNetwork.csv"))
		$template = $template.Replace("wirelessNetworkFreqMHZ.csv",("$name" + "_wirelessNetworkFreqMHZ.csv"))
		$template = $template.Replace("wirelessNetworkGPSInfo.csv",("$name" + "_wirelessNetworkGPSInfo.csv"))
		$template = $template.Replace("wirelessNetworkPackets.csv",("$name" + "_wirelessNetworkPackets.csv"))
		$template = $template.Replace("wirelessNetworkSeenCard.csv",("$name" + "_wirelessNetworkSeenCard.csv"))
		$template = $template.Replace("wirelessNetworkSNRInfo.csv",("$name" + "_wirelessNetworkSNRInfo.csv"))
		$template = $template.Replace("wirelessNetworkSSID.csv",("$name" + "_wirelessNetworkSSID.csv"))
		$template = $template.Replace("wirelessNetworkSSIDEncryption.csv",("$name" + "_wirelessNetworkSSIDEncryption.csv"))

		# Export the .sql statement file used to load the .csv into the database
		$loaderName = ".\" + "$name" + ".sql"
		$template | Out-File $loaderName

		# Move the processed files into their respective folders
		$destination = Get-ChildItem -Path ./ -Directory $name
		Move-Item -Path ".\$name*.csv" -Destination $destination
		Move-Item -Path ".\$name*.sql" -Destination $destination

	}

}
