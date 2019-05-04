function wirelessNetworkTable {

Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessNetwork $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process powershell -ArgumentList "-command  $Scriptblock"

}

}