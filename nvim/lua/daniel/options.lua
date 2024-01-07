-- Special characters
vim.g.mapleader = " " 
vim.g.maplocalleader = " "

-- General settings
vim.opt.mouse = ""				-- Disable mouse
vim.opt.number = true			-- Print line number
vim.opt.relativenumber = true	-- Show relative line number
vim.opt.scrolloff = 8 			-- Minimal number of lines to keep around cursor
vim.opt.shiftwidth = 4 			-- Number of spaces for indent
vim.opt.smartindent = true 		-- Smart autoindent when starting a new line
vim.opt.tabstop = 4 			-- Number of spaces <Tab> counts for
vim.opt.wrap = true 			-- Line wrap
vim.opt.termguicolors = true	-- true color terminal

-- Julia
vim.cmd("let g:latex_to_unicode_keymap = 1")	-- In-place replacement of unicode symbols in Julia
