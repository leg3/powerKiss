function wirelessNetworkFreqMHZStitch { 

$getFirstLine = $true
Get-ChildItem -Recurse -Name -Filter "*_wirelessNetworkFreqMHZ.csv" | ForEach-Object {

$filePath = $_
$lines = Get-Content $filePath
$linesToWrite = switch ($getFirstLine) {

$true { $lines }
$false { $lines | Select-Object -Skip 1 }

}

$getFirstLine = $false
Add-Content .\composite_wirelessNetworkFreqMHZ.csv $linesToWrite

}

}