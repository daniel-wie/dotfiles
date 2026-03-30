-- Filetype and syntax plugin for LaTeX.

vim.pack.add({
	{
		src = "https://github.com/lervag/vimtex",
		version = vim.version.range("*"),
	},
})

if vim.fn.has("win32") == 1 then
	vim.g.vimtex_view_general_viewer = "SumatraPDF"
	vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
else
	vim.g.vimtex_view_method = "zathura_simple"
end

vim.g.vimtex_compiler_latexmk = {
	aux_dir = "build",
	out_dir = "",
}
