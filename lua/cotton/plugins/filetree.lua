return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"s1n7ax/nvim-window-picker",
		},
		config = function()
			require("nvim-tree").setup({
				select_prompts = true,
				hijack_cursor = true,
				sync_root_with_cwd = true,
				view = {
					signcolumn = "auto",
					width = 35,
				},
				renderer = {
					add_trailing = true,
					special_files = {
						"Cargo.toml",
						"Cargo.lock",
						"build.rs",
						"Makefile",
						"build.ninja",
						"CMakeLists.txt",
						"README.md",
						"README",
						"README.txt",
						"justfile",
					},
					symlink_destination = false,
					highlight_diagnostics = "name",
					indent_markers = {
						enable = true,
					},
					icons = {
						git_placement = "right_align",
						show = {
							folder = false,
							folder_arrow = false,
							diagnostics = false,
						},
						glyphs = {
							git = {
								unstaged = "M",
								staged = "A",
								unmerged = "U",
								untracked = "??",
								deleted = "D",
								ignored = "!!",
							},
						},
					},
				},
				git = {
					show_on_open_dirs = false,
				},
				diagnostics = {
					enable = true,
					severity = {
						min = vim.diagnostic.WARNING,
					},
				},
				actions = {
					change_dir = {
						enable = false,
					},
					expand_all = {
						exclude = { ".git", "target", "build", "node_modules" },
					},
					open_file = {
						window_picker = {
							picker = require("window-picker").pick_window,
						},
					},
				},
			})
			-- keymaps
			local keymap = vim.keymap

			keymap.set(
				"n",
				"<leader>ee",
				":NvimTreeFindFileToggle<CR>",
				{ desc = "Toggle file explorer", silent = true }
			)
			keymap.set(
				"n",
				"<leader>ec",
				":NvimTreeCollapseKeepBuffers<CR>",
				{ desc = "Collapse file explorer", silent = true }
			)
			keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

			-- auto expand at start
			local api = require("nvim-tree.api")
			local Event = api.events.Event

			api.events.subscribe(Event.TreeOpen, function()
				api.tree.expand_all()
			end)

			-- close when last window
			vim.api.nvim_create_autocmd("QuitPre", {
				callback = function()
					local tree_wins = {}
					local floating_wins = {}
					local wins = vim.api.nvim_list_wins()
					for _, w in ipairs(wins) do
						local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
						if bufname:match("NvimTree_") ~= nil then
							table.insert(tree_wins, w)
						end
						if vim.api.nvim_win_get_config(w).relative ~= "" then
							table.insert(floating_wins, w)
						end
					end
					if 1 == #wins - #floating_wins - #tree_wins then
						-- Should quit, so we close all invalid windows.
						for _, w in ipairs(tree_wins) do
							vim.api.nvim_win_close(w, true)
						end
					end
				end,
			})
		end,
	},
}
