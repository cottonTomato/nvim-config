return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		event = "VeryLazy",
		cmd = "Trouble",
		config = function()
			require("trouble").setup({
				focus = true,
				warn_no_results = false,
				keys = {
					["<cr>"] = "jump_close",
					o = "jump",
				},
			})

			-- keymap
			local keymap = vim.keymap
			local opts = { silent = true }

			opts.desc = "Explore workspace todos"
			keymap.set("n", "<leader>xw", ":Trouble todo toggle<CR>", opts)

			opts.desc = "Explore buffer diagnostics"
			keymap.set("n", "<leader>xd", ":Trouble diagnostics toggle filter.buf=0<CR>", opts)

			opts.desc = "Explore workspace diagnostics"
			keymap.set(
				"n",
				"<leader>xD",
				":Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>",
				opts
			)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", ":Trouble lsp_declarations toggle<CR>", opts)

			opts.desc = "Go to definition"
			keymap.set("n", "gd", ":Trouble lsp_definitions toggle<CR>", opts)

			opts.desc = "Go to type definition"
			keymap.set("n", "<leader>xt", ":Trouble lsp_type_definitions toggle<CR>", opts)

			opts.desc = "Explore implementations"
			keymap.set("n", "<leader>xi", ":Trouble lsp_implementations toggle<CR>", opts)

			opts.desc = "Explore references"
			keymap.set("n", "<leader>xr", ":Trouble lsp_references toggle<CR>", opts)

			opts.desc = "Explore telescope"
			keymap.set("n", "<leader>xs", ":Trouble telescope toggle<CR>", opts)

			opts.desc = "Explore everything (symbol)"
			keymap.set("n", "<leader>xx", ":Trouble lsp toggle<CR>", opts)
		end,
	},
}
