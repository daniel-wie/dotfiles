-- Lightweight yet powerful formatter plugin for Neovim

vim.pack.add({
	{
		src = "https://github.com/stevearc/conform.nvim",
		version = vim.version.range("*"),
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "prettierd" },
		sh = { "shfmt" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	},
	formatters = {
		shfmt = {
			prepend_args = {
				"--indent",
				"4",
				"--binary-next-line",
				"--case-indent",
				"--space-redirects",
			},
		},
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "CONFORM Format Buffer" })
