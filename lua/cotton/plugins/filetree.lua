return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		event = "VeryLazy",
		config = function()
			local neotree = require("neo-tree")
			neotree.setup({
				enable_opened_markers = false,
				hide_root_node = true,
				source_selector = {
					winbar = true,
					content_layout = "center",
					tab_layout = "active",
				},
				filesystem = {
					hijack_netrw_behavior = "disabled",
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
					icon = {
						folder_closed = "+",
						folder_open = "-",
						folder_empty = "*",
						folder_empty_open = "*",
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
					width = 35,
					mappings = {
						["<CR>"] = "open_with_window_picker",
						["w"] = "open",
						["s"] = "split_with_window_picker",
						["S"] = "vsplit_with_window_picker",
					},
				},
				renderers = {
					file = {
						{ "indent" },
						{
							"container",
							content = {
								{
									"name",
									zindex = 10,
								},
								{
									"symlink_target",
									zindex = 10,
									highlight = "NeoTreeSymbolicLinkTarget",
								},
								{ "clipboard", zindex = 10 },
								{ "bufnr", zindex = 10 },
								{ "modified", zindex = 20, align = "right" },
								{ "diagnostics", errors_only = true, zindex = 20, align = "right" },
								{ "git_status", zindex = 10, align = "right" },
								{ "file_size", zindex = 10, align = "right" },
								{ "type", zindex = 10, align = "right" },
								{ "last_modified", zindex = 10, align = "right" },
								{ "created", zindex = 10, align = "right" },
							},
						},
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
			})

			-- keymap
			local keymap = vim.keymap

			keymap.set(
				"n",
				"<leader>ee",
				":Neotree focus filesystem left toggle reveal<CR>",
				{ desc = "Explore filesystem", silent = true }
			)
			keymap.set(
				"n",
				"<leader>eb",
				":Neotree focus buffers left toggle reveal<CR>",
				{ desc = "Explore buffers", silent = true }
			)
			keymap.set(
				"n",
				"<leader>eg",
				":Neotree focus git_status left toggle reveal<CR>",
				{ desc = "Explore git status", silent = true }
			)
		end,
	},
}
