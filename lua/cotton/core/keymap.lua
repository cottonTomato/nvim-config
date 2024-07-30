-- ergonomics
local keymap = vim.keymap

-- leader
vim.g.mapleader = " "

-- undo redo
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<C-r>", "U", { desc = "Restore last line" })

-- window
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window on the Right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window Below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window Above" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window on the Left" })

-- highlights
keymap.set("n", "z<CR>", ":nohls<CR>", { desc = "Clear highlights", silent = true })

-- mark
keymap.set({ "n", "x" }, "`", "'", { desc = "Mark", noremap = true })
keymap.set({ "n", "x" }, "'", "`", { desc = "Mark", noremap = true })
