function New-ReactComponent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)] [string]$Name,
        [Parameter(Mandatory=$false)] [string]$Extension = "js"
    )

    $srcDirectory = "$(Get-Location)\src"

    # Check For Compontents Directory
    if (!(Test-Path -Path $srcDirectory\Components)) {
        New-Item -Type Directory -Path $srcDirectory -Name "Components" | Out-Null
    }

    $componentsDirectory = "$srcDirectory\Components"
    $componentDirectory = "$srcDirectory\Components\$Name"

    # Stop Program If Folder Exists
    if (Test-Path -Path $componentDirectory) { Write-Host "`nComponent Exists!`n"; return }

    # Create Component Directory Inside Components Directory
    New-Item -Type Directory -Path $componentsDirectory -Name $Name | Out-Null
    
    # File Type # JS Default
    New-Item -Type File -Path $componentDirectory -Name "$Name.$($Extension.ToLower())" | Out-Null
    New-Item -Type File -Path $componentDirectory -Name "$Name.css" | Out-Null

    Write-Host "`nCompontnet `"$Name`" Created.`n"
}