vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local options = { noremap = true }
vim.keymap.set("i", "jk", "<Esc>", options)
