function wirelessNetworkSNRInfoTable {

  Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessNetworkSNRInfo $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process pwsh -ArgumentList "-command  $Scriptblock"

  }

}
