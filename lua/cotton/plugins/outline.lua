return {
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({
				outline_window = {
					position = "left",
					width = 35,
					relative_width = false,
					auto_close = true,
				},
				outline_items = {
					show_symbol_details = false,
					show_symbol_lineno = true,
				},
			})

			vim.keymap.set("n", "<leader>eo", ":Outline<CR>", { desc = "Explore Outline", silent = true })
		end,
	},
}
