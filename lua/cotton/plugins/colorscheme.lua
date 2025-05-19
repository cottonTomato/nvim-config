return {
	"rose-pine/neovim",
	name = "rose-pine",
	event = "VimEnter",
	priority = 100,
	opts = {
		dim_inactive_windows = true,
	},
	init = function()
		vim.opt.background = "dark"
		vim.cmd.colorscheme("rose-pine")
	end,
}
