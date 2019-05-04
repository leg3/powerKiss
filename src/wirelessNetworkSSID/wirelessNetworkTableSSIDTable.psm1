function wirelessNetworkSSIDTable {

  Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessNetworkSSID $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process powershell -ArgumentList "-command  $Scriptblock"

  }

}
