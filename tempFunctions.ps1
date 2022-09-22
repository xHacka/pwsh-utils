function New-TemporaryDirectory {
    $randString = (-join ((65..90) + (97..122) | Get-Random -Count 15 | % {[char]$_}))
    $randName = "tmp-$randString"
    $tmpLocation = "$temp\$randName"
    
    # Create New Directory 
    New-Item -ItemType Directory -Path "$tmpLocation" | Out-Null
    
    # Change Location To New Directory
    Set-Location $tmpLocation 

    # Format Output
    Write-Output "`n$tmpLocation`n"
} 

function New-CustomTemporaryFile {
    $randString = (-join ((65..90) + (97..122) | Get-Random -Count 15 | % {[char]$_}))
    $randName = "tmpFile-$randString"

    if ($args[0]) { $tmpLocation = "$temp\$randName." + $args[0] } 
    else          { $tmpLocation = "$temp\$randName"             }

    # Create New Directory 
    New-Item -ItemType File -Path "$tmpLocation" | Out-Null
    
    # Change Location To New Directory
    code $tmpLocation 

    # Format Output
    Write-Output "`n$tmpLocation`n"
} 

function DeleteTempFiles { Remove-Item -Path $temp\* -Recurse -Force -ErrorAction SilentlyContinue }
