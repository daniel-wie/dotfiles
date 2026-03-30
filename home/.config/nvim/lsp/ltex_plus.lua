-- https://github.com/ltex-plus/ltex-ls-plus

-- https://github.com/barreiroleo/ltex_extra.nvim
-- require("ltex_extra").setup({
-- 	load_langs = { "en-US", "de-AT" },
-- 	path = ".ltex",
-- })

-- https://ltex-plus.github.io/ltex-plus/supported-languages.html#markup-languages
local language_id_mapping = {
	pandoc = "markdown",
	tex = "latex",
}

return {
	cmd = { "ltex-ls-plus" },
	filetypes = {
		"gitcommit",
		"markdown",
		"pandoc",
		"tex",
		"text",
	},
	root_markers = { ".git" },
	get_language_id = function(_, filetype)
		return language_id_mapping[filetype] or filetype
	end,
	settings = {
		ltex = {
			enabled = {
				"gitcommit",
				"latex",
				"markdown",
				"pandoc",
				"plaintex",
				"tex",
				"text",
			},
			language = "en-US",
			additionalRules = {
				enablePickyRules = true,
			},
		},
	},
}
