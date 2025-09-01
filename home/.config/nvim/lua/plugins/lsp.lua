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
					"lua_ls", -- Lua LSP
					"texlab",
					"ltex",
					"pyright", -- Python LSP
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "barreiroleo/ltex_extra.nvim" },

		config = function()
			local lspconfig = require("lspconfig")

			-- Add LSP-powered completion
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

				callback = function(ev)
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
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				capabilities = capabilities,
			})

			-- Julia
			lspconfig.julials.setup({ capabilities = capabilities })

			-- Python
			lspconfig.pyright.setup({})

			-- TexLab (completion etc.)
			lspconfig.texlab.setup({ capabilities = capabilities })

			-- add custom dictionary for exceptions
			local function words()
				local result = {}
				local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
				for word in io.open(path, "r"):lines() do
					table.insert(result, word)
				end
				return result
			end

			-- LTeX (spelling & grammar)
			lspconfig.ltex.setup({
				on_attach = function(client, bufnr)
					require("ltex_extra").setup({
						load_langs = { "en-US", "de-AT" },
						path = ".vscode", -- be nice to other people
					})
				end,
				settings = {
					ltex = {
						language = "en-US",
						dictionary = {
							["en-US"] = words() or {},
						},
					},
				},
				capabilities = capabilities,
				-- flags = lspconfig.lsp_flags,
			})
		end,
	},
}
