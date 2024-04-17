-- Filetype and syntax plugin for LaTeX.
-- https://github.com/lervag/vimtex

return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "build",
			out_dir = "",
		}
		vim.g.vimtex_quickfix_ignore_filters = {
			"Overfull .hbox"
		}
	end,
}
