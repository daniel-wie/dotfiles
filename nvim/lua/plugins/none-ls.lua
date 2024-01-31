return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua formatting
				null_ls.builtins.code_actions.gitsigns, -- gitsigns in code actions
			},
		})
	end,
}
