return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.bufremove" },
		event = "VeryLazy",
		opts = {
			options = {
				modified_icon = "[+]",
				left_trunc_marker = "<-",
				right_trunc_marker = "->",
				separator_style = "thin",
				close_command = "lua require('mini.bufremove').delete(%d, false)",
				custom_filter = function(buf, _)
					local filter_ft = { "neo-tree", "alpha" }
					for _, ft in ipairs(filter_ft) do
						if vim.bo[buf].filetype == ft then
							return false
						end
					end
					return true
				end,
				show_buffer_close_icons = false,
				show_close_icon = false,
				always_show_bufferline = false,
				hover = { enabled = false },
			},
			highlights = {
				indicator_selected = {
					fg = "#eb6f92",
				},
			},
		},
		keys = {
			{
				"gn",
				"<cmd>BufferLineCycleNext<CR>",
				mode = "n",
				desc = "Next buffer",
				silent = true,
			},
			{
				"gp",
				"<cmd>BufferLineCyclePrev<CR>",
				mode = "n",
				desc = "Previous buffer",
				silent = true,
			},
			{
				"<leader><cr>",
				"<cmd>BufferLinePick<CR>",
				mode = "n",
				desc = "Jump to buffer",
				silent = true,
			},
			{
				"<leader>bl",
				"<cmd>BufferLineMoveNext<CR>",
				mode = "n",
				desc = "Move buffer next in line",
				silent = true,
			},
			{

				"<leader>bh",
				"<cmd>BufferLineMovePrev<CR>",
				mode = "n",
				desc = "Move buffer previous in line",
				silent = true,
			},
			{

				"<leader>be",
				"<cmd>BufferLineSortByExtension<CR>",
				mode = "n",
				desc = "Sort buffers by extension",
				silent = true,
			},
			{

				"<leader>bd",
				"<cmd>BufferLineSortByDirectory<CR>",
				mode = "n",
				desc = "Sort buffers by directory",
				silent = true,
			},
			{

				"<leader>bt",
				"<cmd>BufferLineSortByTabs<CR>",
				mode = "n",
				desc = "sort buffers by tabs",
				silent = true,
			},
			{

				"<leader>bk",
				"<cmd>BufferLinePickClose<CR>",
				mode = "n",
				desc = "Pick close buffers",
				silent = true,
			},
			{

				"<leader>bn",
				"<cmd>BufferLineCloseOther<CR>",
				mode = "n",
				desc = "Nuke other buffers",
				silent = true,
			},
		},
	},
}
