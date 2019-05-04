function wirelessClientPacketsTable {

Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessClientPackets $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process powershell -ArgumentList "-command  $Scriptblock"

}

}