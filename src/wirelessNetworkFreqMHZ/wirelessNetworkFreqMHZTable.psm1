function wirelessNetworkFreqMHZTable {

  Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessNetworkFreqMHZ $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process pwsh -ArgumentList "-command  $Scriptblock"

  }

}
