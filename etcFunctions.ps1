# Open git-bash Process
function Bash { git-bash & }

# Copy Current Location To Clipboard
function Path { (pwd).Path | clip }

# Quick Base64 Encode/Decode
function BD($base64) { [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))  }
function BE($plaintext) { [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($plaintext)) }