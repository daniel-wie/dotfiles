return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile", "BufReadPost" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		numhl = true,
		word_diff = true,

		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- stylua: ignore start
			map("n", "]g", gs.next_hunk, "GITSIGNS next hunk")
			map("n", "[g", gs.prev_hunk, "GITSIGNS prev hunk")
			map("n", "<leader>gr", gs.reset_hunk, "GITSIGNS reset hunk")
			map("n", "<leader>gp", gs.preview_hunk, "GITSIGNS preview hunk")
			map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "GITSIGNS blame line")
			map("n", "<leader>gd", gs.diffthis, "GITSIGNS diff this")
			-- stylua: ignore end
		end,
	},
}
