return {
	{ "nvim-lua/plenary.nvim" },
	{
		"stevearc/dressing.nvim",
		evert = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			scope = { enabled = false },
		},
	},
	-- TODO: filter based on function to help allivate the last window issue
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		name = "window-picker",
		event = "VeryLazy",
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
	},
}
