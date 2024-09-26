# Link AppData/Local/nvim to nvim
New-Item -Path C:\Users\balld\AppData\Local\nvim -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\.config\nvim
New-Item -Path C:\Users\balld\AppData\Roaming\fd -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\.config\fd
New-Item -Path C:\Users\balld\.julia\config -ItemType SymbolicLink -Target C:\Users\balld\.dotfiles\.julia\config
