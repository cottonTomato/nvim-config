return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local todo_comments = require("todo-comments")
			todo_comments.setup()

			-- keymap
			local keymap = vim.keymap
			keymap.set("n", "[t", function()
				todo_comments.jump_prev()
			end, { desc = "Previous todo comment", silent = true })
			keymap.set("n", "]t", function()
				todo_comments.jump_next()
			end, { desc = "Next todo comment", silent = true })
		end,
	},
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
				separator = " ",
				mappings = false,
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps",
			},
		},
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
		config = function()
			local bufremove = require("mini.bufremove")
			bufremove.setup({})

			-- keymap
			local keymap = vim.keymap

			keymap.set("n", "<leader>bc", function()
				bufremove.delete(0, false)
			end, { desc = "Close buffer", silent = true })
			keymap.set("n", "<leader>bq", function()
				bufremove.delete(0, true)
			end, { desc = "Force close buffer", silent = true })
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		name = "window-picker",
		event = "VeryLazy",
		config = function()
			local window_picker = require("window-picker")

			window_picker.setup({
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
			})

			vim.keymap.set("n", "<leader><CR>", function()
				local choice = window_picker.pick_window() or vim.api.nvim_get_current_win()
				vim.api.nvim_set_current_win(choice)
			end, { desc = "Jump to window" })
		end,
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinLeave" },
	},
	{
		"echasnovski/mini.misc",
		version = "*",
		config = function()
			local miniMisc = require("mini.misc")
			miniMisc.setup()

			vim.keymap.set("n", "<leader>bz", function()
				miniMisc.zoom()
			end, { desc = "Toggle buffer zoom" })
		end,
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
	{ "echasnovski/mini.cursorword", version = "*", event = { "BufReadPre", "BufNewFile" }, config = true },
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
