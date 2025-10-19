return {
	{
		"williamboman/mason.nvim",
		opts = {
			-- Ensure installation of packages not available in mason-lspconfig.
			ensure_installed = {
				"prettierd", -- Markdown formatting
				"stylua", -- Lua formatting
				"latexindent", -- TeX formatting
				"black", -- Python formatting
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
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

				callback = function(ev)
					-- setup ltex_extra
					-- require("ltex_extra").setup({
					-- 	load_langs = { "en-US", "de-AT" },
					-- 	path = ".ltex",
					-- })

					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local function nmap(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
					end

					nmap("gD", vim.lsp.buf.declaration, "LSP Go to declaration")
					nmap("gd", vim.lsp.buf.definition, "LSP Go to definition")
					nmap("gT", vim.lsp.buf.type_definition, "LSP Go to type definition")
					nmap("gi", vim.lsp.buf.implementation, "LSP Go to implementation")
					nmap("gr", vim.lsp.buf.references, "LSP List references")

					nmap("<leader>rn", vim.lsp.buf.rename, "LSP Rename")
					nmap("<leader>ca", vim.lsp.buf.code_action, "LSP Code action")

					nmap("K", vim.lsp.buf.hover, "LSP Hover Documentation")
					nmap("<C-k>", vim.lsp.buf.signature_help, "LSP Signature documentation")

					nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "LSP Workspace add folder")
					nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "LSP Workspace remove folder")
					nmap("<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "LSP Workspace list folders")

					nmap("<leader>gf", vim.lsp.buf.format, "LSP Format current buffer")

					-- format on save
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = "UserLspConfig",
						buffer = ev.buf,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end,
			})

			-- Diagnostic mappings
			local function nmap(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { desc = desc })
			end

			nmap("<leader>do", vim.diagnostic.open_float, "Diagnostic Open float")
			nmap("]d", vim.diagnostic.goto_next, "Diagnostic Next")
			nmap("[d", vim.diagnostic.goto_prev, "Diagnostic Previous")
			nmap("<leader>dl", vim.diagnostic.setloclist, "Diagnostic List")

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
		end,
	},
}
