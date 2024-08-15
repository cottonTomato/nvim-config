return {
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	event = "VimEnter",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			contrast = "soft",
	-- 		})
	--
	-- 		vim.opt.background = "dark"
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },
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
