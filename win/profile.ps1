# fast node manager
# https://github.com/Schniz/fnm?tab=readme-ov-file#powershell 
fnm env --use-on-cd --shell power-shell | Out-String | Invoke-Expression

# set up Oh My Posh
# https://ohmyposh.dev/docs/installation/prompt
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression

# make powershell a bit better
# https://www.josephguadagno.net/2024/07/26/power-prompt-with-windows-terminal-and-oh-my-posh
Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
