-- TODO: fzf like keymap
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/trouble.nvim",
	},
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")

		local trouble_telescope = require("trouble.sources.telescope")

		telescope.setup({
			path_display = "tail",
			defaults = {
				mappings = {
					i = { ["<C-t>"] = trouble_telescope.open },
					n = { ["<C-t>"] = trouble_telescope.open },
				},
			},
		})

		telescope.load_extension("fzf")

		-- keymap
		local keymap = vim.keymap
		local opts = { silent = true }

		opts.desc = "Search files in cwd"
		keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)

		opts.desc = "Search recently opened files"
		keymap.set("n", "<leader>fF", ":Telescope oldfiles<CR>", opts)

		opts.desc = "Livegrep strings in cwd"
		keymap.set("n", "<leader>/", ":Telescope live_grep<CR>", opts)

		opts.desc = "Grep string under cursor in cwd"
		keymap.set("n", "<leader>fg", ":Telescope grep_string<CR>", opts)

		opts.desc = "Search help tags"
		keymap.set("n", "<leader>fH", ":Telescope help_tags<CR>", opts)

		opts.desc = "Search man pages"
		keymap.set("n", "<leader>fh", ":Telescope man_pages sections=ALL<CR>", opts)

		opts.desc = "Search marks"
		keymap.set("n", "<leader>fm", ":Telescope marks<CR>", opts)

		opts.desc = "Search jumplist"
		keymap.set("n", "<leader>fj", ":Telescope jumplist<CR>", opts)

		opts.desc = "Search quickfixlist"
		keymap.set("n", "<leader>fk", ":Telescope quickfix<CR>", opts)

		opts.desc = "Search loclist"
		keymap.set("n", "<leader>fl", ":Telescope loclist<CR>", opts)

		-- lsp bindings
		opts.desc = "Search document symbols"
		keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opts)

		opts.desc = "Search workspace symbols"
		keymap.set("n", "<leader>fS", ":Telescope lsp_workspace_symbols<CR>", opts)

		-- session workflow
		opts.desc = "Search sessions"
		keymap.set("n", "<leader>sf", ":Telescope session-lens<CR>", opts)
	end,
}
