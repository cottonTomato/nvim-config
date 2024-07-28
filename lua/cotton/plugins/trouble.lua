return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		event = "VeryLazy",
		cmd = "Trouble",
		confit = function()
			require("trouble").setup({ focus = true })

			-- keymap
			local keymap = vim.keymap

			keymap.set("n", "<leader>xq", ":Trouble qflist toggle<CR>", { desc = "Open quickfix list", silent = true })
			keymap.set("n", "<leader>xl", ":Trouble loclist toggle<CR>", { desc = "Open loclist", silent = true })
			keymap.set("n", "<leader>xt", ":Trouble todo toggle<CR>", { desc = "Show todos", silent = true })
			keymap.set(
				"n",
				"<leader>xd",
				":Trouble diagnostics toggle filter.buf=0<CR>",
				{ desc = "Show buffer diagnostics", silent = true }
			)
			keymap.set(
				"n",
				"<leader>xD",
				":Trouble diagnostics toggle<CR>",
				{ desc = "Show workspace diagnostics", silent = true }
			)
			keymap.set(
				"n",
				"<leader>xx",
				":Trouble lsp toggle focus=false<CR>",
				{ desc = "Show symbol definitions / reference", silent = true }
			)
		end,
	},
}
