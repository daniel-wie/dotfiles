-- 🍨 Soothing pastel theme for (Neo)vim

vim.pack.add({
	{
		src = "https://github.com/catppuccin/nvim",
		version = vim.version.range("*"),
		name = "catppuccin",
	},
})

require("catppuccin").setup({
	flavour = "mocha",
	dim_inactive = {
		enabled = true, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
})

vim.cmd.colorscheme("catppuccin")
