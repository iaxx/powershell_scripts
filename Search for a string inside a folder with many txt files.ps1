$folder = Read-Host -Prompt 'path to folder'
$string = Read-Host -Prompt 'string to match'
Get-ChildItem -Path $folder -Filter *.txt | ForEach-Object {
    $file = $_
    Select-String -Path $file.FullName -Pattern $string -AllMatches | Select-Object -Property Filename, Line, @{Name="File"; Expression={$file.Name}}
}
