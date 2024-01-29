return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")
		local h = require("null-ls.helpers")
		local methods = require("null-ls.methods")

		-- use JuliaFormatter.jl as julia formatter
		local julia = {
			method = methods.internal.FORMATTING,
			name = "JuliaFormatter",
			filetypes = { "julia" },
			generator = h.formatter_factory({
				command = "julia",
				args = {
					"-J",
					"~/.juliaformatter/juliaformatter.dll", -- use a sysimage to avoid precompilation
					"-e",
					"using JuliaFormatter; println(format_text(String(read(stdin))))",
				},
				to_stdin = true,
				timeout = 30000,
			}),
		}

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua formatting
				null_ls.builtins.code_actions.gitsigns, -- gitsigns in code actions
				julia, -- julia formatting
			},
		})
	end,
}
