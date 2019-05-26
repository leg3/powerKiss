# Log the count from our .csv files for reference
Get-ChildItem -Recurse -Name -Filter "*_cardSource.csv" | ForEach-Object {

    $_ | Out-File log.txt -Append
    Import-Csv $_ | Measure-Object | Out-File log.txt -Append
  
  }