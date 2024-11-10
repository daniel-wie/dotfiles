# This script sets everything up on Windows.
# It needs to be run in the top directory of dotfiles.

function Download {
	param ($Url)

	Invoke-WebRequest -Uri $Url -OutFile (Split-Path $Url -Leaf)
}

function New-SymbolicLink {
	param ($Path, $Target)

	New-Item -Path $Path -ItemType SymbolicLink -Target $Target -Force
}

# Texlive
Download https://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe
Start-Process install-tl-windows.exe -Wait
rm install-tl-windows.exe

# Julia
winget install julia -s msstore
New-SymbolicLink $HOME\.julia\config $PSScriptRoot\home\.julia\config
New-SymbolicLink $HOME\.julia\environments $PSScriptRoot\home\.julia\environments

# Neovim
Download https://github.com/neovim/neovim/releases/latest/download/nvim-win64.msi
Start-Process nvim-win64.msi -Wait
rm nvim-win64.msi
New-SymbolicLink $HOME\AppData\Local\nvim $PSScriptRoot\home\.config\nvim

New-SymbolicLink $HOME\AppData\Roaming\fd $PSScriptRoot\home\.config\fd
New-SymbolicLink $HOME\.prettierrc $PSScriptRoot\home\.prettierrc
New-SymbolicLink $HOME\.ssh\config $PSScriptRoot\home\.ssh\config

New-SymbolicLink D:\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 $PSScriptRoot\win\profile.ps1
New-SymbolicLink "$env:LOCALAPPDATA\Microsoft\Windows` Terminal\Fragments" $PSScriptRoot\win\Fragments

Install-Module Terminal-Icons -Scope CurrentUser
