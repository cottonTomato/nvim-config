local opt = vim.opt

-- guifont
opt.guifont = "FiraCode Nerd Font"

-- linenumber
opt.relativenumber = true
opt.number = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- folding
-- vim.opt.

-- line wrapping
opt.wrap = false

-- cursorline
opt.cursorline = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- window
opt.splitright = true
opt.splitbelow = true

-- swapfile
opt.swapfile = false

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- neovide settings
if vim.g.neovide then
	vim.g.neovide_fullscreen = true
	vim.g.neovide_theme = "dark"
	vim.g.neovide_input_macos_option_key_is_meta = "both"
	vim.g.neovide_input_ime = true

	-- disable animations
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_scroll_animation_length = 0.00
	vim.g.neovide_hide_mouse_when_typing = true
end
