function wirelessClientTable {

Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "wirelessClient $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process powershell -ArgumentList "-command  $Scriptblock"

}

}