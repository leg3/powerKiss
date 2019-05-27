function checkTable {

	if (-not (Test-Path "./*cardSource.csv")) { Write-Host "cardSource Table - ABSENT!" }
	if (-not (Test-Path "./*detectionRun.csv")) { Write-Host "detectionRun Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessClient.csv")) { Write-Host "wirelessClient Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessClientGPSInfo.csv")) { Write-Host "wirelessClientGPSInfo Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessClientPackets.csv")) { Write-Host "wirelessClientPackets Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessClientSNRInfo.csv")) { Write-Host "wirelessClientSNRInfo Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessClientSeenCard.csv")) { Write-Host "wirelessClientSeenCard Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetwork.csv")) { Write-Host "wirelessNetwork Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetworkFreqMHZ.csv")) { Write-Host "wirelessNetworkFreqMHZ Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetworkGPSInfo.csv")) { Write-Host "wirelessNetworkGPSInfo Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetworkPackets.csv")) { Write-Host "wirelessNetworkPackets Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetworkSNRInfo.csv")) { Write-Host "wirelessNetworkSNRInfo Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetworkSSID.csv")) { Write-Host "wirelessNetworkSSID Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetworkSSIDEncryption.csv")) { Write-Host "wirelessNetworkSSIDEncryption Table - ABSENT!" }
	if (-not (Test-Path "./*wirelessNetworkSeenCard.csv")) { Write-Host "wirelessNetworkSeenCard Table - ABSENT!" }

}
