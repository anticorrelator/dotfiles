vim.g.mapleader = ','

-- Whether to load netrw by default
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- use jj to exit insert mode
vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })