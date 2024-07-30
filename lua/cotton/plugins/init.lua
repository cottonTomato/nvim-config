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
}
