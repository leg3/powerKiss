function detectionRunTable {

  Get-ChildItem -Name -Filter "*.netxml" | ForEach-Object {

    $cmdstring = "detectionRun $_" + " " + ".\"
    $scriptblock = [scriptblock]::Create($cmdstring)
    Start-Process pwsh -ArgumentList "-command  $Scriptblock"

  }

}
