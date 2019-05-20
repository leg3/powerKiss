function sweep {
Get-ChildItem -Path ${psscriptroot} -Name -Filter "*.netxml" | ForEach-Object {
$name = $_.Replace(".netxml","")
mkdir $name
$destination = Get-ChildItem -Path ./ -Directory $name
Move-Item -Path ".\$name*.csv" -Destination $destination
Move-Item -Path ".\$name*.netxml" -Destination $destination    
}
}