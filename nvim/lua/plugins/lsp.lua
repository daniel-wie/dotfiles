return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				-- only for windows
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"texlab",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities() -- add lsp-powered completion

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

			-- LaTeX
			lspconfig.texlab.setup({ capabilities = capabilities })
		end,
	},
}
