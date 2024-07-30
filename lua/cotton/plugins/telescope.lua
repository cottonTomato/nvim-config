-- TODO: fzf like keymap
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
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
		keymap.set("n", "<leader>f<CR>", ":Telescope live_grep<CR>", opts)

		opts.desc = "Grep string under cursor in cwd"
		keymap.set("n", "<leader>f<SPACE>", ":Telescope grep_string<CR>", opts)

		opts.desc = "Search help tags"
		keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

		opts.desc = "Search man pages"
		keymap.set("n", "<leader>fH", ":Telescope man_pages sections=ALL<CR>", opts)

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

		opts.desc = "Search buffer diagnostics"
		keymap.set("n", "<leader>fd", ":Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "Search workspace diagnostics"
		keymap.set("n", "<leader>fD", ":Telescope diagnostics<CR>", opts)

		opts.desc = "Search for implementations"
		keymap.set("n", "<leader>fi", ":Telescope lsp_implementations<CR>", opts)

		opts.desc = "Search for references"
		keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)

		-- buffer workflow
		opts.desc = "Search buffer"
		keymap.set("n", "<leader>bf", ":Telescope buffer<CR>", opts)

		-- session workflow
		opts.desc = "Search sessions"
		keymap.set("n", "<leader>sf", ":Telescope session-lens<CR>", opts)

		-- todos
		opts.desc = "Search todos"
		keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", opts)

		-- misc
		opts.desc = "Search & Reload Plugins"
		keymap.set("n", "<leader>pr", ":Telescope reloader<CR>", opts)
	end,
}
