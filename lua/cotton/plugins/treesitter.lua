return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"arduino",
					"asm",
					"bash",
					"c",
					"cmake",
					"cpp",
					"css",
					"dockerfile",
					"editorconfig",
					"fish",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"hurl",
					"html",
					"java",
					"javascript",
					"jsonc",
					"json",
					"just",
					"kconfig",
					"linkerscript",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"meson",
					"nginx",
					"ninja",
					"objc",
					"pioasm",
					"proto",
					"python",
					"rust",
					"sql",
					"ssh_config",
					"starlark",
					"swift",
					"terraform",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
					"zig",
				},
				indent = { enable = true },
				highlight = {
					enable = true,
				},
			})
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
							["am"] = {
								query = "@function.outer",
								desc = "outer function/method",
							},
							["im"] = {
								query = "@function.inner",
								desc = "inner function/method",
							},
							["ac"] = { query = "@class.outer", desc = "outer class" },
							["ic"] = { query = "@class.inner", desc = "inner class" },
							["a/"] = { query = "@comment.outer", desc = "outer comment" },
							["i/"] = { query = "@comment.inner", desc = "inner comment" },
							["ap"] = { query = "@parameter.outer", desc = "outer parameter" },
							["ip"] = { query = "@parameter.inner", desc = "inner parameter" },
							["af"] = { query = "@call.outer", desc = "outer call" },
							["if"] = { query = "@call.inner", desc = "inner call" },
							["aB"] = { query = "@block.outer", desc = "outer block" },
							["iB"] = { query = "@block.inner", desc = "inner block" },
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = { query = "@function.outer", desc = "Next function start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]s"] = { query = "@block.outer", desc = "Next block start" },
							["]f"] = { query = "@call.outer", desc = "Next call start" },
						},
						goto_next_end = {
							["]M"] = { query = "@function.outer", desc = "Next function end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]S"] = { query = "@block.outer", desc = "Next block end" },
							["]F"] = { query = "@call.outer", desc = "Next call end" },
						},
						goto_previous_start = {
							["[m"] = { query = "@function.outer", desc = "Previous function start" },
							["[c"] = { query = "@class.outer", desc = "Previous class start" },
							["[s"] = { query = "@block.outer", desc = "Previous block start" },
							["[f"] = { query = "@call.outer", desc = "Previous call start" },
						},
						goto_previous_end = {
							["[M"] = { query = "@function.outer", desc = "Previous function end" },
							["[C"] = { query = "@class.outer", desc = "Previous block end" },
							["[S"] = { query = "@block.outer", desc = "Previous block end" },
							["[F"] = { query = "@call.outer", desc = "Previous call end" },
						},
					},
				},
			})

			-- keymap
			local keymap = vim.keymap
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
			keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr())
			keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr())
			keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr())
			keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr())
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			local get_option = vim.filetype.get_option

			---@diagnostic disable-next-line: duplicate-set-field
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
		end,
	},
}
