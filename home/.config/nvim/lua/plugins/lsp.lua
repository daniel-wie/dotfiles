return {
	{
		"williamboman/mason.nvim",
		opts = {
			-- Ensure installation of packages not available in mason-lspconfig.
			ensure_installed = {
				"prettierd", -- Markdown formatting
				"stylua", -- Lua formatting
				"tex-fmt", -- TeX formatting
				"black", -- Python formatting
				"shfmt", -- Shell formatting
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			local mr = require("mason-registry")

			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)

				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"texlab",
					"ltex_plus",
					"pyright",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"barreiroleo/ltex_extra.nvim",
		},

		config = function()
			-- Lua
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- Julia
			vim.lsp.enable("julials")

			-- Python
			vim.lsp.enable("pyright")

			-- LaTeX
			vim.lsp.config("ltex_plus", {
				on_attach = function()
					require("ltex_extra").setup({
						load_langs = { "en-US", "de-AT" },
						path = ".ltex",
					})
				end,
				settings = {
					ltex = { language = "en-US" },
				},
			})
			vim.lsp.enable({ "ltex_plus", "texlab" })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					-- Enable completion triggered by <c-x><c-o>
					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				end,
			})
		end,
	},
}
