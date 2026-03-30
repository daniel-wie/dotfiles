-- Portable package manager for Neovim that runs everywhere Neovim runs.
-- Easily install and manage LSP servers, DAP servers, linters, and formatters.

vim.pack.add({
	{
		src = "https://github.com/williamboman/mason.nvim",
	},
})

require("mason").setup()

local ensure_installed = {
	"lua-language-server", -- Lua LSP
	"stylua", -- Lua formatting
	"texlab", -- LaTeX LSP
	"tex-fmt", -- LaTeX formatting
	"prettierd", -- Markdown formatting
	"ltex-ls-plus", -- Spell checker
	"basedpyright", -- Python LSP
	"ruff", -- Python formatting
	"shfmt", -- Shell formatting
}

local mr = require("mason-registry")

mr.update()

for _, tool in ipairs(ensure_installed) do
	local p = mr.get_package(tool)

	if not p:is_installed() then
		p:install()
	end
end
