return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		opts = {
			options = {
				globalstatus = true,
			},
			sections = {
				lualine_c = {
					{
						"buffers",
						component_separators = { left = "", right = "" },
						section_separators = { left = "", right = "" },
						symbols = {
							modified = " [+]",
							alternate_file = "",
						},
						buffers_color = {
							active = { fg = "#ea9a97", gui = "italic" },
						},
						filetype_names = {
							snacks_picker_list = "Explorer",
							snacks_dashboard = "Dashboard",
						},
					},
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
			extensions = {
				"lazy",
				"mason",
			},
		},
	},
}
