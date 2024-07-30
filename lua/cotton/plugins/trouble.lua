return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		event = "VeryLazy",
		cmd = "Trouble",
		config = function()
			require("trouble").setup({ focus = true })

			-- keymap
			local keymap = vim.keymap
			local opts = { silent = true }

			opts.desc = "Explore quickfixlist"
			keymap.set("n", "<leader>eq", ":Trouble qflist toggle<CR>", opts)

			opts.desc = "Explore loclist"
			keymap.set("n", "<leader>el", ":Trouble loclist toggle<CR>", opts)

			opts.desc = "Explore workspace todos"
			keymap.set("n", "<leader>et", ":Trouble todo toggle<CR>", opts)

			opts.desc = "Explore buffer diagnostics"
			keymap.set("n", "<leader>ed", ":Trouble diagnostics toggle filter.buf=0<CR>", opts)

			opts.desc = "Explore workspace diagnostics"
			keymap.set(
				"n",
				"<leader>eD",
				":Trouble diagnostics toggle filter.severity=vim.diagnostics.severity.ERROR<CR>",
				opts
			)

			opts.desc = "Explore implementations"
			keymap.set("n", "<leader>ei", ":Trouble lsp_implementations toggle<CR>", opts)

			opts.desc = "Explore references"
			keymap.set("n", "<leader>er", ":Trouble lsp_references toggle<CR>", opts)
		end,
	},
}
