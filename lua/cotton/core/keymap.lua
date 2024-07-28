-- ergonomics
local keymap = vim.keymap

-- leader
vim.g.mapleader = " "

-- numbers
keymap.set("n", "<M-a>", "<C-a>", { desc = "Increment Numbers" })
keymap.set("n", "<M-x>", "<C-x>", { desc = "Decrement Numbers" })

-- undo redo
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<C-r>", "U", { desc = "Restore last line" })

-- window
keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wc", "<C-w>c", { desc = "Close window without closing buffer" })
keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Close window and close buffer" })
keymap.set("n", "<leader>wf", "<C-w>f", { desc = "Open file under cursor in new window" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window on the Right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window Below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window Above" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window on the Left" })

-- highlights
keymap.set("n", "z<CR>", ":nohls<CR>", { desc = "Clear highlights", silent = true })
