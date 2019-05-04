function wirelessNetworkSNRInfoStitch { 

$getFirstLine = $true
Get-ChildItem -Recurse -Name -Filter "*_wirelessNetworkSNRInfo.csv" | ForEach-Object {

$filePath = $_
$lines = Get-Content $filePath
$linesToWrite = switch ($getFirstLine) {

$true { $lines }
$false { $lines | Select-Object -Skip 1 }

}

$getFirstLine = $false
Add-Content .\composite_wirelessNetworkSNRInfo.csv $linesToWrite

}

}