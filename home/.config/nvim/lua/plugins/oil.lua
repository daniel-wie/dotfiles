return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>ex", "<CMD>Oil<CR>", { desc = "Oil Open parent directory" })

		require("oil").setup({
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			buf_options = {
				buflisted = true,
				bufhidden = "hide",
			},
			view_options = { show_hidden = true },
		})
	end,
}
