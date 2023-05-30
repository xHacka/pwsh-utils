function Delete-Temporary { Remove-Item -Path $temp\* -Recurse -Force -ErrorAction SilentlyContinue }

function New-Temporary {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)] [switch]$Directory,
        [Parameter(Mandatory=$false)] [switch]$File,
        [Parameter(Mandatory=$false)] [string]$Extension,
        [Parameter(Mandatory=$false)] [switch]$Code
    )
    $randString = (-join ((65..90) + (97..122) | Get-Random -Count 15 | % {[char]$_}));
    
    if ($File) {
        # Random File Name
        $tmpLocation = "$temp\tmpFile-$randString";

        # Add Extension If Any
        if ($Extension -ne "") { $tmpLocation += ".$Extension"; }
        # Create New File
        New-Item -ItemType File -Path "$tmpLocation" | Out-Null;
    } else {
        # Random Directory Name
        $tmpLocation = "$temp\tmp-$randString";
    
        # Create New Directory 
        New-Item -ItemType Directory -Path "$tmpLocation" | Out-Null;
        
        # Change Location To New Directory
        Set-Location $tmpLocation;
    }
    
    # Open With Code        
    if ($Code) { code $tmpLocation; }

    # Format Output
    Write-Output "`n$tmpLocation`n";
} 
