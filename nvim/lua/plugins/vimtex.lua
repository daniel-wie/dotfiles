-- Filetype and syntax plugin for LaTeX.
-- https://github.com/lervag/vimtex

return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_general_viewer = "SumatraPDF"
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "build",
			out_dir = "",
		}
	end,
}
