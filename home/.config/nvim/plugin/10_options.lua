-- Special characters
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Filetype
vim.g.tex_flavor = "latex"

-- Provider
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- General settings
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Use `clipboard-osc52` or system clipboard
vim.opt.cursorline = true -- Highlight current line
vim.opt.mouse = "a" -- Mouse support
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Show relative line number
vim.opt.scrolloff = 8 -- Minimal number of lines to keep around cursor
vim.opt.sidescrolloff = 8 -- Minimal number of columns to keep around cursor
vim.opt.expandtab = true -- Expand tabs into spaces
vim.opt.shiftwidth = 4 -- Number of spaces for indent
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.shortmess:append({ I = true }) -- Don't give intro message when starting Vim
vim.opt.signcolumn = "yes" -- Always show signcolumn
vim.opt.smartindent = true -- Smart autoindent when starting a new line
vim.opt.spelllang = { "en", "de" } -- Spellcheck for these languages
vim.opt.spelloptions = { "camel" } -- camel case treated as separate word
vim.opt.tabstop = 4 -- Number of spaces <Tab> counts for
vim.opt.termguicolors = true -- True color terminal
vim.opt.undofile = true -- Save undo history
vim.opt.winborder = "rounded" -- Style of floating windows
vim.opt.wrap = false -- Line wrap

-- Show diagnostics below line
vim.diagnostic.config({ virtual_text = { current_line = true } })
