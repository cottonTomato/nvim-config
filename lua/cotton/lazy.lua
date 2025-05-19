local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<leader><leader>z", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

require("lazy").setup({ { import = "cotton.plugins" }, { import = "cotton.plugins.tools" } }, {
	change_detection = {
		notify = false,
	},
	checker = {
		notify = true,
		enabled = true,
	},
	ui = {
		border = "rounded",
		title = "Lazy.nvim",
	},
})
