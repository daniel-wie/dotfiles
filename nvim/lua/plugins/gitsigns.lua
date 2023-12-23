return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add          = { text = '+' },
			change       = { text = '│' },
			delete       = { text = '_' },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
		},
		
		signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
		numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = { follow_files = true },
		
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
		
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end
		end,
	},
}
