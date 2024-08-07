return {
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{
		"stevearc/dressing.nvim",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			scope = { enabled = false },
		},
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinLeave" },
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
		"knubie/vim-kitty-navigator",
		build = "cp ./*.py ~/.config/kitty/",
		init = function()
			vim.g.kitty_navigator_no_mappings = 1
		end,
		config = function()
			-- keymap
			local keymap = vim.keymap

			keymap.set("n", "<M-h>", ":KittyNavigateLeft<CR>", { desc = "Move to window on left", silent = true })
			keymap.set("n", "<M-j>", ":KittyNavigateDown<CR>", { desc = "Move to window below", silent = true })
			keymap.set("n", "<M-k>", ":KittyNavigateUp<CR>", { desc = "Move to window above", silent = true })
			keymap.set("n", "<M-l>", ":KittyNavigateRight<CR>", { desc = "Move to window on right", silent = true })
		end,
	},
}
