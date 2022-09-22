

# pwsh-utils

Useful Powershell Utils

1. Create Temporary Folder
2. Create Temporary File (**NEEDS VSCODE**)
3. Clear Temporary Folder
4. Open Exporer With Given Path (If Not Given Will Open Current Working Directory)

# Import

    $ProfileLocation =  $(Split-Path  -Parent $Profile)
    
    Import-Module $ProfileLocation\Scripts\MyScripts\tempFunctions.ps1
    Import-Module $ProfileLocation\Scripts\MyScripts\explorerFunctions.ps1
   
<sup>Note: You're Free To Import From Wherever You Want</sup>

# Alias

    $temp = $ENV:TEMP
    
    Set-Alias  -Name "mktemp" -Value "New-TemporaryDirectory"
    Set-Alias  -Name "mkfile" -Value "New-CustomTemporaryFile"
    Set-Alias  -Name "rmtemp" -Value "DeleteTempFiles"
    Set-Alias  -Name "e"      -Value "OpenExplorerAtCurrentDirectory"
    
<sup>Note: You Can Use Functions Without `alias` But Its Just Convinient To Do So</sup>

# Usage

`mktemp`

> Creates A Directory In Temporary Directory And Moves Into It
> *Folder Name: tmp-{random 15 characters}*

`mkfile`

> Creates A File In Temporary Directory **And Opens It Using VSCode**
> **With Second Argument** It Will Create File With Given Argument As Extension
> **Without Second Argument** It Will Create File With No Extension
> *File Name: tmpFile-{random 15 characters}*

`rmtemp`

> Deletes Temporary Directory Files/Folders Which Aren't In Use.
> ***If Files Are Left In Directory It Means Some Proccess Is Using It***

`e`

> Shorthand For `explorer` 
> **With Second Argument** It Will Open Exporer In Given Argument As Path
> **Without Second Argument** It Will Open Explorer In Current Directory
