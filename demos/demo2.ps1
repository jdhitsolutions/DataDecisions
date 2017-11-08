#be careful with data files

Get-Content .\names.txt

Get-Content .\names.txt | Get-Service

#skip blank lines
Get-Content .\names.txt | where {$_ } | Get-Service

#still need to trim
(Get-Content .\names.txt | where {$_ }).foreach( {$_.trim()}) | Get-Service

#fine tune
(Get-Content .\names.txt | 
where {$_ -match '\w+' }).foreach( {$_.trim()}) | Get-Service

Function Optimize-Text {
    [cmdletbinding()]
    Param (
        [Parameter(Position = 0,ValueFromPipeline)]
        [string]$Text
    )
    Begin {}
    Process {
        if ($text -match "\S+") {
            $text.Trim()
        }
    }
    End {}
}

Get-Content .\names.txt | Optimize-Text | Get-Service
