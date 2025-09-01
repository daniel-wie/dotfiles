return {
	{
		-- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
		dependencies = {
			{
				-- https://github.com/nvim-treesitter/nvim-treesitter-context
				"nvim-treesitter/nvim-treesitter-context",
				config = true,
			},
			{
				-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
			},
		},
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"julia",
				"python",
				"markdown",
				"markdown_inline",
				"diff",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"powershell",
				"toml",
				"yaml",
				"bash",
				"latex", -- For render-markdown.nvim
				"html",
				"json",
				"regex",
			},
		},
		config = function(_, opts)
			-- Install languages
			require("nvim-treesitter").install(opts.ensure_installed)

			-- Highlighting
			-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#highlighting
			vim.api.nvim_create_autocmd("FileType", {
				pattern = require("nvim-treesitter").get_installed(),
				callback = function()
					vim.treesitter.start()
				end,
			})

			-- Textobjects
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
			})

			-- Text objects: move
			local function move_next_start(lhs, obj, desc)
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					require("nvim-treesitter-textobjects.move").goto_next_start(obj, "textobjects")
				end, { desc = desc })
			end
			move_next_start("]c", "@class.outer", "TS Jump to next class start")
			move_next_start("]f", "@function.outer", "TS Jump to next function start")
			move_next_start("]p", "@parameter.inner", "TS Jump to next parameter start")

			local function move_next_end(lhs, obj, desc)
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					require("nvim-treesitter-textobjects.move").goto_next_end(obj, "textobjects")
				end, { desc = desc })
			end
			move_next_end("]C", "@class.outer", "TS Jump to next class end")
			move_next_end("]F", "@function.outer", "TS Jump to next function end")

			local function move_previous_start(lhs, obj, desc)
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					require("nvim-treesitter-textobjects.move").goto_previous_start(obj, "textobjects")
				end, { desc = desc })
			end
			move_previous_start("[c", "@class.outer", "TS Jump to previous class start")
			move_previous_start("[f", "@function.outer", "TS Jump to previous function start")
			move_previous_start("[p", "@parameter.inner", "TS Jump to previous parameter start")

			local function move_previous_end(lhs, obj, desc)
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					require("nvim-treesitter-textobjects.move").goto_previous_end(obj, "textobjects")
				end, { desc = desc })
			end
			move_previous_end("[C", "@class.outer", "TS Jump to previous class end")
			move_previous_end("[F", "@function.outer", "TS Jump to previous function end")

			-- Text objects: select
			local function sel(lhs, obj, desc)
				vim.keymap.set({ "x", "o" }, lhs, function()
					require("nvim-treesitter-textobjects.select").select_textobject(obj, "textobjects")
				end, { desc = desc })
			end
			sel("ac", "@class.outer", "TS Select around class")
			sel("af", "@function.outer", "TS Select around function")
			sel("ic", "@class.inner", "TS Select inside class")
			sel("if", "@function.inner", "TS Select inside function")

			-- Text objects: swap
			vim.keymap.set("n", "<leader>spn", function()
				require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
			end, { desc = "TS Swap parameter next" })
			vim.keymap.set("n", "<leader>spp", function()
				require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
			end, { desc = "TS Swap parameter previous" })
		end,
	},
}
