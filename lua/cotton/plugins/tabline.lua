return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.bufremove" },
		event = "VeryLazy",
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					modified_icon = "[+]",
					left_trunc_marker = "<-",
					right_trunc_marker = "->",
					separator_style = "thin",
					close_command = "lua require('mini.bufremove').delete(%d, false)",
					custom_filter = function(buf, buf_nums)
						local filter_ft = { "neo-tree" }
						for _, ft in ipairs(filter_ft) do
							if vim.bo[buf].filetype == ft then
								return false
							end
						end
						return true
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "Explorer",
							text_align = "center",
							separator = true,
						},
						{
							filetype = "Outline",
							text = "Outline",
							text_align = "center",
							separator = true,
						},
					},
					show_buffer_close_icons = false,
					show_close_icon = false,
					always_show_bufferline = false,
					hover = { enabled = false },
				},
				highlights = {
					indicator_selected = {
						fg = "#98971a",
					},
				},
			})

			-- keybind
			local keymap = vim.keymap

			keymap.set("n", "gn", ":BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
			keymap.set("n", "gp", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer", silent = true })
			keymap.set("n", "<leader><space>", ":BufferLinePick<CR>", { desc = "Jump to buffer", silent = true })

			keymap.set(
				"n",
				"<leader>bl",
				":BufferLineMoveNext<CR>",
				{ desc = "Move buffer next in line", silent = true }
			)
			keymap.set(
				"n",
				"<leader>bh",
				":BufferLineMovePrev<CR>",
				{ desc = "Move buffer previous in line", silent = true }
			)
			keymap.set(
				"n",
				"<leader>be",
				":BufferLineSortByExtension<CR>",
				{ desc = "Sort buffers by extension", silent = true }
			)
			keymap.set(
				"n",
				"<leader>bd",
				":BufferLineSortByDirectory<CR>",
				{ desc = "Sort buffers by directory", silent = true }
			)
			keymap.set("n", "<leader>bt", ":BufferLineSortByTabs<CR>", { desc = "sort buffers by tabs", silent = true })

			keymap.set("n", "<leader>bk", ":BufferLinePickClose<CR>", { desc = "Pick close buffers", silent = true })
			keymap.set("n", "<leader>bn", ":BufferLineCloseOther<CR>", { desc = "Nuke other buffers", silent = true })
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			local barbecue = require("barbecue")

			barbecue.setup({
				create_autocmd = false,
				show_dirname = false,
				show_modified = true,
				show_basename = false,
			})

			vim.opt.updatetime = 200
			vim.api.nvim_create_autocmd({
				"WinScrolled",
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	},
}
