return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"folke/trouble.nvim",
		},
		opts = function()
			local telescope = require("telescope")
			telescope.load_extension("fzf")

			local actions = require("telescope.actions")
			local trouble_telescope = require("trouble.sources.telescope")
			return {
				defaults = {
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					mappings = {
						i = {
							["<C-x>"] = false,
							["<C-s>"] = actions.select_horizontal,
							["<C-f>"] = false,
							["<C-k>"] = false,
							["<M-f>"] = false,
							["<M-k>"] = false,
							["<C-l>"] = false,
							["<C-w>"] = false,
							["<C-r><C-w>"] = false,
							["<C-r><C-a>"] = false,
							["<C-r><C-f>"] = false,
							["<C-r><C-l>"] = false,
							["<M-t>"] = trouble_telescope.open,
						},
						n = {
							["<C-x>"] = false,
							["<C-s>"] = actions.select_horizontal,
							["<C-f>"] = false,
							["<C-k>"] = false,
							["<M-f>"] = false,
							["<M-k>"] = false,
							["<M-t>"] = trouble_telescope.open,
						},
					},
				},
			}
		end,
		keys = {
			{
				"<leader>ff",
				"<cmd>Telescope find_files theme=ivy<CR>",
				mode = "n",
				desc = "Search files in cwd",
				silent = true,
			},
			{
				"<leader>/",
				"<CMD>Telescope live_grep theme=ivy<CR>",
				mode = "n",
				desc = "Livegrep strings in cwd",
				silent = true,
			},
			{
				"<leader>fh",
				"<CMD>Telescope help_tags theme=ivy<CR>",
				mode = "n",
				desc = "Search help tags",
				silent = true,
			},
			{
				"<leader>fm",
				"<CMD>Telescope man_pages sections=ALL theme=ivy<CR>",
				mode = "n",
				desc = "Search man pages",
				silent = true,
			},
			{
				"<leader><cr>",
				"<CMD>Telescope buffers sort_mru=true ignore_current_buffer=true theme=ivy<CR>",
				mode = "n",
				desc = "Search open buffers",
				silent = true,
			},
			{
				"<leader>fs",
				"<CMD>Telescope lsp_document_symbols theme=ivy<CR>",
				mode = "n",
				desc = "Search document symbols",
				silent = true,
			},
			{
				"<leader>fS",
				"<CMD>Telescope lsp_workspace_symbols theme=ivy<CR>",
				mode = "n",
				desc = "Search workspace symbols",
				silent = true,
			},
			{
				"<leader>fr",
				"<CMD>Telescope lsp_references theme=ivy<CR>",
				mode = "n",
				desc = "Search workspace references",
				silent = true,
			},
		},
	},
}
