return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		event = "VimEnter",
		priority = 100,
		opts = {},
		init = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("rose-pine-moon")
		end,
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		event = { "WinLeave" },
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = {
				border = "single",
			},
			select = {
				backend = { "builtin", "telescope" },
				builtin = {
					border = "single",
				},
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			notification = {
				override_vim_notify = true,
				view = {
					stack_upwards = false,
				},
				window = {
					align = "top",
				},
			},
		},
		keys = {
			{
				"<leader><leader>?",
				"<cmd>Fidget history<cr>",
				mode = "n",
				desc = "Notification history",
				silent = true,
			},
		},
	},
	{ "echasnovski/mini.cursorword", version = "*", event = { "BufReadPre", "BufNewFile" }, opts = {} },
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			mappings = {
				object_scope = "",
				object_scope_with_border = "",
			},
			draw = {
				delay = 100,
				priority = 2,
				animation = function(s, n)
					return s / n * 20
				end,
			},
		},
	},
}
