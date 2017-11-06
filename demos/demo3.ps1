#compare relative sizes

get-ciminstance win32_process | Export-Clixml .\scratch.xml

[xml]$doc = get-ciminstance win32_process | Convertto-xml
$f = join-path -path (Convert-path .) -ChildPath scratch2.xml
$doc.Save($f)

get-ciminstance win32_process | ConvertTo-Json | Set-Content -Path .\scratch.json
Get-CimInstance win32_process | export-csv -Path .\scratch.csv

get-ciminstance win32_process | Out-File -FilePath .\scratch.txt

Dir scratch* | sort length -Descending

Import-Clixml .\scratch.xml | Select -first 5 -property Name 
import-csv .\scratch.csv | select -first 5 -property Name 
#converting from json is different
get-content .\scratch.json | convertfrom-json | select -first 5 -property Name
get-content .\scratch.json | convertfrom-json | get-member
$j = get-content .\scratch.json | convertfrom-json 
$j | select -first 5 -Property Name

Get-Content .\scratch.txt

#beware of type
#json is good
$j[0] | Get-Member
#probably the best
Import-Clixml .\scratch.xml | Select -first 1 | get-member 
#native XML also pretty good
psedit $f
#the worst
import-csv .\scratch.csv | select -first 1 | get-member
