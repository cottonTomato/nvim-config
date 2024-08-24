-- ergonomics
local keymap = vim.keymap

-- leader
vim.g.mapleader = " "

-- undo redo
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<C-r>", "U", { desc = "Restore last line" })

-- highlights
keymap.set("n", "gN", "<cmd>nohls<CR>", { desc = "Clear highlights", silent = true })

-- mark
keymap.set({ "n", "x" }, "`", "'", { desc = "Mark", noremap = true })
keymap.set({ "n", "x" }, "'", "`", { desc = "Mark", noremap = true })
