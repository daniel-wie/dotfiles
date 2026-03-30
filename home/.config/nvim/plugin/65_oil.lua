-- Neovim file explorer: edit your filesystem like a buffer

vim.pack.add({
	{
		src = "https://github.com/stevearc/oil.nvim",
	},
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons",
	},
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "OIL Open Parent Directory" })
