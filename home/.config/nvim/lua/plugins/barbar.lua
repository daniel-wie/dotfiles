-- Tab bar
-- https://github.com/romgrk/barbar.nvim

return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- git status
		"nvim-tree/nvim-web-devicons", -- file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false

		local function nmap(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
		end

		nmap("<A-h>", "<Cmd>BufferPrevious<CR>", "BB Go to previous buffer")
		nmap("<A-l>", "<Cmd>BufferNext<CR>", "BB Go to next buffer")
		nmap("<A-,>", "<Cmd>BufferMovePrevious<CR>", "BB Swap with previous buffer")
		nmap("<A-.>", "<Cmd>BufferMoveNext<CR>", "BB Swap with next buffer")
		nmap("<A-c>", "<Cmd>BufferClose<CR>", "BB Close buffer")
		nmap("<A-p>", "<Cmd>BufferPick<CR>", "BB Pick buffer")
	end,
	opts = {
		icons = {
			separator = { left = "\\", right = "\\" },
			separator_at_end = false,
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
		},
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
