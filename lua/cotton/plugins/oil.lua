return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local oil = require("oil")
			oil.setup({
				delete_to_trash = true,
				columns = {
					"icon",
					"permissions",
					"size",
					"mtime",
				},
				keymaps = {
					["<C-/>s"] = {
						"actions.select",
						opts = { horizontal = true },
						desc = "Open the entry in a horizontal split",
					},
					["<C-/>v"] = {
						"actions.select",
						opts = { vertical = true },
						desc = "Open the entry in a vertical split",
					},
					["<C-s>"] = "actions.refresh",
					["<C-h>"] = false,
					["<C-l>"] = false,
				},
			})

			vim.keymap.set("n", "<leader>to", function()
				oil.open(vim.fn.getcwd())
			end, { desc = "Open cd in oil" })
		end,
	},
}
