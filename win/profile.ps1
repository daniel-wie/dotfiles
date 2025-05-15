# make powershell a bit better
# https://www.josephguadagno.net/2024/07/26/power-prompt-with-windows-terminal-and-oh-my-posh
Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Invoke-Expression (&starship init powershell)
