# This script does the same as gnu stow but by hand...
New-Item -Path C:\Users\balld\AppData\Local\nvim -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\.config\nvim
New-Item -Path C:\Users\balld\AppData\Roaming\fd -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\.config\fd
New-Item -Path C:\Users\balld\.julia\config -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\.julia\config
New-Item -Path C:\Users\balld\.prettierrc -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\.prettierrc
New-Item -Path D:\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\PowerShell_profile.ps1
