function Install-Software {                    #Verb-Noun
    Write-Host "I installed some software!"
    }

function Install-Hardware {                   
    [CmdletBinding()]                     # + [CmdletBinding()] upgrade to advance function to call common cmdlet in a function
    Param (
        [Parameter(Mandatory)]
        [String]$Version
        )
    Write-Host "I have installed version $Version"
    }

    function Install-Firmware {                   
    [CmdletBinding()]                     # + [CmdletBinding()] upgrade to advance function to call common cmdlet in a function
    Param (
        [Parameter(Mandatory)]
        [ValidateSet("1","2")             # User can only input 1 or 2, if not, an error msg will hint user to input 1 or 2
        [String]$Version
        [String]$ComputerName
        )
    Write-Host "I have installed version $Version in $ComputerName"
    }


$ComputerName = @("SRV1", "SRV2", "SRV3")
foreach ($pc in $ComputerName) {
    Install-Firmware -Version 2 -ComputerName $pc
    }