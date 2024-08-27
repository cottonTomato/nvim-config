return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			source_selector = {
				winbar = true,
				content_layout = "center",
				tab_layout = "active",
			},
			filesystem = {
				filtered_items = {
					never_show = {
						".git",
						".DS_Store",
					},
				},
			},
			default_component_configs = {
				indent = {
					with_markers = true,
				},
				name = {
					trailing_slash = true,
				},
				git_status = {
					symbols = false,
					align = "right",
				},
			},
			window = {
				width = "70",
				height = "20",
				position = "float",
				mappings = {
					["s"] = "split_with_window_picker",
					["S"] = "vsplit_with_window_picker",
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		},
		keys = {
			{
				"<leader>ee",
				"<cmd>Neotree focus filesystem toggle reveal<CR>",
				mode = "n",
				desc = "Explore filetree",
				silent = true,
			},
			{
				"<leader>eb",
				"<cmd>Neotree focus buffers toggle reveal<CR>",
				mode = "n",
				desc = "Explore buffers",
				silent = true,
			},
			{
				"<leader>eg",
				"<cmd>Neotree focus git_status toggle reveal<CR>",
				mode = "n",
				desc = "Explore git status",
				silent = true,
			},
		},
	},
}
