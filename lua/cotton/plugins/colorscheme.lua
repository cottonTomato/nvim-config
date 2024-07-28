return {
	{
		"ellisonleao/gruvbox.nvim",
		event = "VimEnter",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "soft",
			})
			vim.opt.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
