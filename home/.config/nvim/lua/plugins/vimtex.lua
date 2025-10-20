-- Filetype and syntax plugin for LaTeX.
-- https://github.com/lervag/vimtex

return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		if vim.fn.has("win32") == 1 then
			vim.g.vimtex_view_general_viewer = "SumatraPDF"
			vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
		else
			vim.g.vimtex_view_method = "zathura"
		end

		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "build",
			out_dir = "",
		}
	end,
}
