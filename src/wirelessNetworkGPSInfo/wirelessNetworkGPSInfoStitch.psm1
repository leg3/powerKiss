function wirelessNetworkGPSInfoStitch { 

$getFirstLine = $true
Get-ChildItem -Recurse -Name -Filter "*_wirelessNetworkGPSInfo.csv" | ForEach-Object {

$filePath = $_
$lines = Get-Content $filePath
$linesToWrite = switch ($getFirstLine) {

$true { $lines }
$false { $lines | Select-Object -Skip 1 }

}

$getFirstLine = $false
Add-Content .\composite_wirelessNetworkGPSInfo.csv $linesToWrite

}

}