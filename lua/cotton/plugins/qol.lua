return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
		},
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
	{
		"echasnovski/mini.bufremove",
		version = "*",
		opts = {},
		keys = {
			{
				"<leader>bc",
				"<cmd>lua require('mini.bufremove').delete(0, false)<cr>",
				mode = "n",
				desc = "Close buffer",
				silent = true,
			},
			{
				"<leader>bq",
				"<cmd>lua require('mini.bufremove').delete(0, true)<cr>",
				mode = "n",
				desc = "Force close buffer",
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
}
