return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			preset = "modern",
			icons = {
				breadcrumb = ">",
				separator = " ",
				mappings = false,
			},
			win = {
				border = "rounded",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			{
				"[t",
				"<cmd>lua require('todo-comments').jump_prev()<cr>",
				mode = "n",
				desc = "Previous todo comment",
				silent = true,
			},
			{
				"]t",
				"<cmd>lua require('todo-comments').jump_next()<cr>",
				mode = "n",
				desc = "Next todo comment",
				silent = true,
			},
			{
				"<leader>xt",
				"<cmd>lua require('snacks').picker.todo_comments()<CR>",
				mode = "n",
				desc = "Explore workspace todos",
				silent = true,
			},
		},
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		name = "window-picker",
		opts = {
			hint = "floating-big-letter",
			show_prompt = false,
			filter_func = function(window_ids, filters)
				local function predicate(wid)
					local cfg = vim.api.nvim_win_get_config(wid)
					if not cfg.focusable then
						return false
					end
					return true
				end
				local filtered = vim.tbl_filter(predicate, window_ids)

				local dfilter = require("window-picker.filters.default-window-filter"):new()
				dfilter:set_config(filters)
				return dfilter:filter_windows(filtered)
			end,
		},
		keys = {
			{
				"gw",
				function()
					local choice = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
					vim.api.nvim_set_current_win(choice)
				end,
				desc = "Jump to window",
			},
		},
	},
	{
		"nmac427/guess-indent.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{ "echasnovski/mini.cursorword", event = { "BufReadPre", "BufNewFile" }, opts = {} },
}
