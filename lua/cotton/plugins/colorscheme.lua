return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({})

			vim.opt.background = "dark"
			vim.cmd.colorscheme("rose-pine-moon")
		end,
	},
}
