return {
	{
		"echasnovski/mini.files",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local files = require("mini.files")
			files.setup()

			vim.keymap.set("n", "<leader>ef", function()
				files.open()
			end, { desc = "Explore filesystem" })
		end,
	},
}
