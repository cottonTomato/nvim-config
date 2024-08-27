return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		event = "VimEnter",
		priority = 100,
		config = function()
			require("rose-pine").setup({})

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
		event = "VimEnter",
		priority = 100,
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
		"echasnovski/mini.notify",
		version = "*",
		event = "VimEnter",
		priority = 100,
		config = function()
			local notify = require("mini.notify")
			notify.setup({
				content = {
					format = function(notif)
						local time = vim.fn.strftime("%H:%M", math.floor(notif.ts_update))
						local icon = ({ ERROR = "E", WARN = "W", INFO = "I", TRACE = "T", DEBUG = "D" })[notif.level]
						return string.format("%s | %s: %-20s", time, icon, notif.msg)
					end,
				},
				lsp_progress = {
					enable = false,
				},
			})

			vim.notify = notify.make_notify()

			-- keymap
			vim.keymap.set("n", "<leader>?", notify.show_history, { desc = "Notifications", silent = true })
		end,
	},
}
