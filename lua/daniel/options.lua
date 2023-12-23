-- Special characters
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General settings
vim.opt.mouse = ""		-- Disable mouse
vim.opt.number = true		-- Print line number
vim.opt.relativenumber = true	-- Show relative line number

-- Julia
vim.cmd("let g:latex_to_unicode_keymap = 1")	-- In-place replacement of unicode symbols in Julia
vim.cmd("hi link juliaFunctionCall Identifier")	-- Highlight function calls
