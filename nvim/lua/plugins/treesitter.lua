return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = true,
			},
			"nvim-treesitter/nvim-treesitter-textobjects",
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
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {
				"latex", -- use vimtex as source instead
			},
			highlight = {
				enable = true
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			indent = {
				enable = true
			},
			textobjects = {
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]p"] = { query = "@parameter.inner", desc = "TS Jump to next parameter" },
						["]i"] = { query = "@conditional.outer", desc = "TS Jump to next conditional start" },
						["]l"] = { query = "@loop.outer", desc = "TS Jump to next loop start" },
						["]f"] = { query = "@function.outer", desc = "TS Jump to next function start" },
						["]c"] = { query = "@class.outer", desc = "TS Jump to next class start" },
					},
					goto_next_end = {
						["]I"] = { query = "@conditional.outer", desc = "TS Jump to next conditional end" },
						["]L"] = { query = "@loop.outer", desc = "TS Jump to next loop end" },
						["]F"] = { query = "@function.outer", desc = "TS Jump to next function end" },
						["]C"] = { query = "@class.outer", desc = "TS Jump to next class end" },
					},
					goto_previous_start = {
						["[p"] = { query = "@parameter.inner", desc = "TS Jump to previous parameter" },
						["[i"] = { query = "@conditional.outer", desc = "TS Jump to previous conditional start" },
						["[l"] = { query = "@loop.outer", desc = "TS Jump to previous loop start" },
						["[f"] = { query = "@function.outer", desc = "TS Jump to previous function start" },
						["[c"] = { query = "@class.outer", desc = "TS Jump to previous class start" },
					},
					goto_previous_end = {
						["[I"] = { query = "@conditional.outer", desc = "TS Jump to previous conditional end" },
						["[L"] = { query = "@loop.outer", desc = "TS Jump to previous loop end" },
						["[F"] = { query = "@function.outer", desc = "TS Jump to previous function end" },
						["[C"] = { query = "@class.outer", desc = "TS Jump to previous class end" },
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["a="] = { query = "@assignment.outer", desc = "TS Select around assginment" },
						["i="] = { query = "@assignment.inner", desc = "TS Select inside assignment" },
						["l="] = { query = "@assignment.lhs", desc = "TS Select left side assignment" },
						["r="] = { query = "@assignment.rhs", desc = "TS Select right side assignment" },
						["ai"] = { query = "@conditional.outer", desc = "TS Select around conditional" },
						["ii"] = { query = "@conditional.inner", desc = "TS Select inner conditional" },
						["al"] = { query = "@loop.outer", desc = "TS Select outer loop" },
						["il"] = { query = "@loop.inner", desc = "TS Select inner loop" },
						["af"] = { query = "@function.outer", desc = "TS Select around function" },
						["if"] = { query = "@function.inner", desc = "TS Select inside function" },
						["ic"] = { query = "@class.inner", desc = "TS Select inside class" },
						["ac"] = { query = "@class.outer", desc = "TS Select around class" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>spn"] = { query = "@parameter.inner", desc = "TS Swap parameter next" },
						["<leader>sfn"] = { query = "@function.outer", desc = "TS Swap function next" },
						["<leader>scn"] = { query = "@class.outer", desc = "TS Swap class next" },
					},
					swap_previous = {
						["<leader>spp"] = { query = "@parameter.inner", desc = "TS Swap parameter previous" },
						["<leader>sfp"] = { query = "@function.outer", desc = "TS Swap function previous" },
						["<leader>scp"] = { query = "@class.outer", desc = "TS Swap class previous" },
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
