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
		"echasnovski/mini.misc",
		version = "*",
		opts = {},
		keys = {
			{
				"<leader>bz",
				"<cmd>lua require('mini.misc').zoom()<cr>",
				mode = "n",
				desc = "Toggle buffer zoom",
				silent = true,
			},
		},
	},
	{
		"chrishrb/gx.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		submodules = false,
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Browse" },
		keys = { { "<leader>o", "<cmd>Browse<cr>", mode = { "n", "x" }, desc = "Open in browser" } },
		opts = { handler_options = { search_engine = "https://search.brave.com/search?q=" } },
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
		},
	},
}
