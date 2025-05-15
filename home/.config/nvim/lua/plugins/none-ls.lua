return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Lua formatting
				null_ls.builtins.code_actions.gitsigns, -- Gitsigns in code actions
				null_ls.builtins.formatting.prettierd, -- Markdown formatting
				null_ls.builtins.formatting.black, -- Python formatting
			},
		})
	end,
}
