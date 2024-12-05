-- Special characters
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General settings
vim.opt.mouse = "a" -- Disable mouse
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Show relative line number
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 8 -- Minimal number of lines to keep around cursor
vim.opt.shiftwidth = 4 -- Number of spaces for indent
vim.opt.smartindent = true -- Smart autoindent when starting a new line
vim.opt.tabstop = 4 -- Number of spaces <Tab> counts for
vim.opt.wrap = false -- Line wrap
vim.opt.termguicolors = true -- True color terminal
vim.opt.undofile = true -- Save undo history
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Use `clipboard-osc52` or system clipboard
