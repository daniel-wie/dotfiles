-- Plugin to improve viewing Markdown files in Neovim

vim.pack.add({
	{
		src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
	},
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons",
	},
})
