-- Git integration for buffers

vim.pack.add({
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
	},
})

require("gitsigns").setup({
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

		map("n", "<leader>gr", gs.reset_hunk, "GITSIGNS Reset Hunk")
		map("n", "<leader>gp", gs.preview_hunk, "GITSIGNS Preview Hunk")

		map("n", "<leader>gh", gs.stage_hunk, "GITSIGNS Stage Hunk")
		map("v", "<leader>gh", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "GITSIGNS Stage Hunk")

		map("v", "<leader>gr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("n", "]g", gs.next_hunk, "GITSIGNS Next Hunk")
		map("n", "[g", gs.prev_hunk, "GITSIGNS Previous Hunk")
		map({ "o", "x" }, "ih", gs.select_hunk, "GITSIGNS Select Hunk")

		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, "GITSIGNS Blame Line")

		map("n", "<leader>gd", gs.diffthis, "GITSIGNS Diff This")
	end,
})
