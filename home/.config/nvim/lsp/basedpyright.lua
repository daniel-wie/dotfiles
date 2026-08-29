-- https://github.com/detachhead/basedpyright

return {
	cmd = { "uv", "run", "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)

		local root = vim.fs.root(fname, {
			"pyproject.toml",
			"uv.lock",
		})

		if root then
			on_dir(root)
		end
	end,
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
	offset_encoding = "utf-8",
}
