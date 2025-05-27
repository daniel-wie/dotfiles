return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	lazy = false,
	config = function()
		local oil = require("oil")

		oil.setup({
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
