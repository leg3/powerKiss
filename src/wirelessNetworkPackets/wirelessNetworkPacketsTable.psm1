function wirelessNetworkPacketsTable {

  Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessNetworkPackets $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process pwsh -ArgumentList "-command  $Scriptblock"

  }

}
