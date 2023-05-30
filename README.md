

# pwsh-utils

Useful Powershell Utils

1. Create Temporary Folder
2. Create Temporary File
3. Clear Temporary Folder
4. Open Exporer With Given Path (If Not Given Will Open Current Working Directory)

# Import

    Import-Module /path/to/scripts/functions.ps1
   
# [Optional] Alias

    $temp = $ENV:TEMP
        
    Set-Alias -Name "mktemp" -Value "New-Temporary"
    Set-Alias -Name "rmtemp" -Value "Delete-Temporary"
    Set-Alias -Name "e"      -Value "Open-Explorer" 
    
<sup>Note: You Can Use Functions Without `alias` But Its Just Convinient To Do So</sup>

# Usage

`New-Temporary`

> Creates A Directory (By Default) In Temporary Directory And Moves Into It
> 
> *Folder Name: tmp-{random 15 characters}*

`New-Temporary -File`

> Creates A File In Temporary Directory
> 
> -Extension: Will Create File With Given Extension, Defaults To None<br>
> -Code: Will Open File In VSCode After Creation, Defaults To False
> 
> *File Name: tmpFile-{random 15 characters}*

`Delete-Temporary`

> Deletes Temporary Directory Files/Folders Which Aren't In Use.
> 
> ***If Files Are Left In Directory It Means Some Proccess Is Using It***

`Open-Explorer` or alias `e`

> Shorthand For `explorer` 
> 
> -Directory: Will Open Exporer In Given Directory
> 
> **Without Second Argument** It Will Open Explorer In Current Directory

`Path`

> Copies Current Path To Clipboard

`BD`

> Decodes Given Base64 String

`BE`

> Base64 Encodes Given Plaintext
