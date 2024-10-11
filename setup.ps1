# This script does the same as gnu stow but by hand...

function New-SymbolicLink {
	param (
		[Parameter(Mandatory)][string]$Path,
		[Parameter(Mandatory)][string]$Target
	)

	New-Item -Path $Path -ItemType SymbolicLink -Target $Target
}

New-SymbolicLink $HOME\AppData\Local\nvim $HOME\.dotfiles\.config\nvim
New-SymbolicLink $HOME\AppData\Roaming\fd $HOME\.dotfiles\.config\fd
New-SymbolicLink $HOME\.julia\config $HOME\.dotfiles\.julia\config
New-SymbolicLink $HOME\.prettierrc $HOME\.dotfiles\.prettierrc
New-SymbolicLink $HOME\.ssh\config $HOME\.dotfiles\.ssh\config
New-SymbolicLink D:\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 $HOME\.dotfiles\PowerShell_profile.ps1
