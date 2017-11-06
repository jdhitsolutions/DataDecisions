#be careful with data files

get-content .\names.txt

get-content .\names.txt | get-service

#skip blank lines
get-content .\names.txt | where {$_ } | get-service

#still need to trim
(get-content .\names.txt | where {$_ }).foreach( {$_.trim()}) | get-service

#fine tune
(get-content .\names.txt | where {$_ -match '\w+' }).foreach( {$_.trim()}) | get-service

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

Get-content .\names.txt | Optimize-Text | Get-Service
