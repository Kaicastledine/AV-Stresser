function Trigger-AntiVirus{

    <#
        .SYNOPSIS
        Function used to trigger an antivirus alert.

        .DESCRIPTION
        Expirimental function that triggers an antivirus reaction using the 'EICAR test string'. Can be used for social engineering. Most commonly used as a tool to slow the reaction time of antivirus applications.

        .PARAMETER Clean
        You should always clean up your messes, this is a default. Some antivirus may auto clean anyway, but again...no messes.

        .PARAMETER Common
        A switch to specify the use of common infection points as a place to inject the test string.

        .PARAMETER Limit
        An integer used to specify the maximum number of injections
    
        .PARAMETER Min
        An integer used to specify the smallest number of seconds to wait between injections.

        .PARAMETER Max
        An integer used to specify the largest number of seconds to wait between injections.

        .PARAMETER Path
        A string specifying a directory to inject the test string to.

        .CREDITS
        LogoiLab (Chad Baxter)

        .LINK
        https://www.github.com/LogoiLab/AV-Stresser

    #>

    $ErrorActionPreference = "Continue"

    param(
        [Parameter(Mandatory=$False,Position=0)]
        [switch]$Clean,
        [Parameter(Mandatory=$False,Position=1)]
        [switch]$Common,
        [Parameter(Mandatory=$False,Position=2)]
        [int]$Limit,
        [Parameter(Mandatory=$True,Position=3)]
        [int]$Max,
        [Parameter(Mandatory=$True,Position=4)]
        [int]$Min,
        [Parameter(Mandatory=$False,Position=5)]
        [string]$Path
    )

    #Set up common paths.
    $commonpaths = "$env:APPDATA", "$env:TEMP", "$env:HOMEPATH"
    
    #EICAR string stored as base64...why?.. because if it is plain text AV will trigger on this line.
    $base64 = 'WAA1AE8AIQBQACUAQABBAFAAWwA0AFwAUABaAFgANQA0ACgAUABeACkANwBDAEMAKQA3AH0AJABFAEkAQwBBAFIALQBTAFQAQQBOAEQAQQBSAEQALQBBAE4AVABJAFYASQBSAFUAUwAtAFQARQBTAFQALQBGAEkATABFACEAJABIACsASAAqAA=='
    
    #Load EICAR string to memory.
    $eicar = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($base64));

    #Default Clean parameter to true.{
    if($Clean -eq $null){
        $Clean = $true
    }
    #}

    #Default Limit parameter to 1. If Limit is 0 throw error.{
    if($Limit -eq $null){
        $Limit = 1
    }
    if($Limit -eq 0){
        throw "Limit cannot be zero!"
        exit
    }
    #}

    #Make sure either Path or Common are specified.
    if($Path -eq $null -and ($Common -eq $false -or $Common -eq $null)){
        throw "Please use common paths, or specify a path!"
        exit
    }

    #If the user chooses common paths, use them
    if($Common){
        if($Path -ne $null){
            if(Test-Path $Path){
                $commonpaths += $Path
                $i = 0
                while($i -lt $Limit){
                    foreach($place in $commonpaths){
                        Start-Sleep (Get-Random -Maximum $Max -Minimum $Min)
                        if($i -gt 0 -and $Clean -eq $true){
                            Remove-Item -Path "$place\$name.tmp" -Force | Out-Null
                        }
                        $name = New-Random
                        New-Item -Path "$place\$name.tmp" -ItemType File -Force
                        Set-Content -Path "$place\$name.tmp" -Value $eicar -Force
                    }
                }
            }
            else{
                throw "$Path is not a valid path!"
                $i = 0
                while($i -lt $Limit){
                    foreach($place in $commonpaths){
                        Start-Sleep (Get-Random -Maximum $Max -Minimum $Min)
                        if($i -gt 0 -and $Clean -eq $true){
                            Remove-Item -Path "$place\$name.tmp" -Force | Out-Null
                        }
                        $name = New-Random
                        New-Item -Path "$place\$name.tmp" -ItemType File -Force
                        Set-Content -Path "$place\$name.tmp" -Value $eicar -Force
                    }
                }
            }
        }
        else{
            $i = 0
            while($i -lt $Limit){
                foreach($place in $commonpaths){
                    if($i -gt 0 -and $Clean -eq $true){
                        Remove-Item -Path "$place\$name.tmp" -Force | Out-Null
                    }
                    Start-Sleep (Get-Random -Maximum $Max -Minimum $Min)
                    $name = New-Random
                    New-Item -Path "$place\$name.tmp" -ItemType File -Force
                    Set-Content -Path "$place\$name.tmp" -Value $eicar -Force
                }
            }
        }
    }
    #If the user doesn't choose common paths, use the path specified.
    else{
        if(Test-Path $Path){
            while($i -lt $Limit){
                        Start-Sleep (Get-Random -Maximum $Max -Minimum $Min)
                        if($i -gt 0 -and $Clean -eq $true){
                            Remove-Item -Path "$Path\$name.tmp" -Force | Out-Null
                        }
                        $name = New-Random
                        New-Item -Path "$Path\$name.tmp" -ItemType File -Force
                        Set-Content -Path "$Path\$name.tmp" -Value $eicar -Force
            }
        }
        else{
            throw "$Path is not a valid path!"
    }
}
}