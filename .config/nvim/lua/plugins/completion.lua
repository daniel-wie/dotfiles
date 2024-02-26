return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- lsp
		"hrsh7th/cmp-path", -- path completion
		"hrsh7th/cmp-buffer", -- completion from buffer
		"L3MON4D3/LuaSnip", -- luasnip
		"saadparwaiz1/cmp_luasnip", -- luasnip to cmp
		"rafamadriz/friendly-snippets", -- vscode snippets
		"kdheepak/cmp-latex-symbols", -- latex symbols
		"onsails/lspkind.nvim", -- pictograms
	},
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "latex_symbols" },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					with_text = true,
					menu = {
						nvim_lsp = "LSP",
						luasnip = "SNI",
						latex_symbols = "TEX",
						buffer = "BUF",
						path = "PAT",
					},
				}),
			},
		})
	end,
}
