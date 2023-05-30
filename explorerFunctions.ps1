function Open-Explorer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [string]$Directory
    )

    if ($Directory) { explorer $Directory     }
    else            { explorer (Get-Location) }
}

function Get-DirectorySize { 
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)] [string]$Directory = "."
    )

    Get-ChildItem -Path $Directory -ErrorAction SilentlyContinue | 
    Where-Object { $_.PSIsContainer } | 
    ForEach-Object { 
        $objectsLength = $(
            Get-ChildItem $_ -Recurse -ErrorAction SilentlyContinue | 
            Measure-Object Length -Sum -ErrorAction SilentlyContinue
        )
        $objectsSize = "{0:N2}" -f ($objectsLength.Sum / 1MB)
        echo "$($_.Name): $objectsSize MB";
    } 
}
