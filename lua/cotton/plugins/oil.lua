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
			})

			vim.keymap.set("n", "<leader>to", function()
				oil.open_float(vim.fn.getcwd())
			end, { desc = "Open cd in oil" })
		end,
	},
}
