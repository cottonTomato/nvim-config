return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/trouble.nvim",
		"nvim-telescope/telescope-frecency.nvim",
	},
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("fzf")
		telescope.load_extension("frecency")

		local trouble_telescope = require("trouble.sources.telescope")
		local actions = require("telescope.actions")

		telescope.setup({
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
			extensions = {
				frecency = {
					db_safe_mode = false,
				},
			},
		})

		-- keymap
		local keymap = vim.keymap
		local opts = { silent = true }

		opts.desc = "Search files in cwd"
		keymap.set("n", "<leader>ff", "<cmd>Telescope frecency workspace=CWD theme=ivy<CR>", opts)

		opts.desc = "Livegrep strings in cwd"
		keymap.set("n", "<leader>/", "<CMD>Telescope live_grep theme=ivy<CR>", opts)

		opts.desc = "Search help tags"
		keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags theme=ivy<CR>", opts)

		opts.desc = "Search man pages"
		keymap.set("n", "<leader>fm", "<CMD>Telescope man_pages sections=ALL theme=ivy<CR>", opts)

		opts.desc = "Search jumplist"
		keymap.set("n", "<leader>fj", "<CMD>Telescope jumplist theme=ivy<CR>", opts)

		-- lsp bindings
		opts.desc = "Search document symbols"
		keymap.set("n", "<leader>fs", "<CMD>Telescope lsp_document_symbols theme=ivy<CR>", opts)

		opts.desc = "Search workspace symbols"
		keymap.set("n", "<leader>fS", "<CMD>Telescope lsp_workspace_symbols theme=ivy<CR>", opts)

		opts.desc = "Search workspace references"
		keymap.set("n", "<leader>fr", "<CMD>Telescope lsp_references theme=ivy<CR>", opts)

		-- git
		opts.desc = "Search buffer commits"
		keymap.set("n", "<leader>fc", "<CMD>Telescope git_bcommits theme=ivy<CR>", opts)
	end,
}
