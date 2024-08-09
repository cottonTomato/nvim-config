return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cmake",
					"cpp",
					"dockerfile",
					"fish",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"json",
					"javascript",
					"just",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"rust",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
					"zig",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "grr",
						node_incremental = "gri",
						scope_incremental = "grs",
						node_decremental = "grd",
					},
				},
				indent = { enable = true },
				highlight = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
			})

			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["a;"] = { query = "@statement.outer", desc = "outer statement" },
							["af"] = { query = "@function.outer", desc = "outer function" },
							["if"] = { query = "@function.inner", desc = "inner function" },
							["ac"] = { query = "@class.outer", desc = "outer class" },
							["ic"] = { query = "@class.inner", desc = "inner class" },
							["a/"] = { query = "@comment.outer", desc = "outer comment" },
							["i/"] = { query = "@comment.inner", desc = "inner comment" },
							["ap"] = { query = "@parameter.outer", desc = "outer parameter" },
							["ip"] = { query = "@parameter.inner", desc = "inner parameter" },
							["as"] = { query = "@block.outer", desc = "outer block" },
							["is"] = { query = "@block.inner", desc = "inner block" },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["grp"] = "@parameter.inner",
							["gr;"] = "@statement.outer",
						},
						swap_previous = {
							["gRp"] = "@parameter.inner",
							["gR;"] = "@statement.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = { query = "@function.outer", desc = "Next function start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]s"] = { query = "@block.outer", desc = "Next block start" },
						},
						goto_next_end = {
							["]M"] = { query = "@function.outer", desc = "Next function end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]S"] = { query = "@block.outer", desc = "Next block end" },
						},
						goto_previous_start = {
							["[m"] = { query = "@function.outer", desc = "Previous function start" },
							["[c"] = { query = "@class.outer", desc = "Previous class start" },
							["[s"] = { query = "@block.outer", desc = "Previous block start" },
						},
						goto_previous_end = {
							["[M"] = { query = "@function.outer", desc = "Previous function end" },
							["[C"] = { query = "@class.outer", desc = "Previous block end" },
							["[S"] = { query = "@block.outer", desc = "Previous block end" },
						},
						goto_next = {
							["];"] = { query = "@statement.outer", desc = "Next statement" },
							["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
							["]/"] = { query = "@comment.inner", desc = "Next comment" },
						},
						goto_previous = {
							["[;"] = { query = "@statement.outer", desc = "Previous statement" },
							["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
							["[/"] = { query = "@comment.inner", desc = "Previous comment" },
						},
					},
				},
			})
		end,
	},
}
