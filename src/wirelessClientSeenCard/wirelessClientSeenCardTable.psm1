function wirelessClientSeenCardTable {

  Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessClientSeenCard $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process powershell -ArgumentList "-command  $Scriptblock"

  }

}
