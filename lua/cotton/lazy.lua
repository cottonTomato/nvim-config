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

local keymap = vim.keymap
keymap.set("n", "<leader>pl", ":Lazy<CR>", { desc = "Open Lazy" })
keymap.set("n", "<leader>ps", ":Lazy sync<CR>", { desc = "Sync packages with config" })
keymap.set("n", "<leader>pc", ":Lazy check<CR>", { desc = "Check packages for updates" })
keymap.set("n", "<leader>px", ":Lazy clean<CR>", { desc = "Clean un-needed packages" })

require("lazy").setup({ { import = "cotton.plugins" }, { import = "cotton.plugins.tools" } }, {
	change_detection = {
		notify = false,
	},
	checker = {
		notify = true,
		enabled = true,
	},
})
