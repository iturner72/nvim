vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local options = { noremap = true }
vim.keymap.set("i", "jk", "<Esc>", options)

-- move blocks of code in v mode using J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- centered C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- centered search 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- spell check
vim.keymap.set("n", "<Leader>s", function()
    vim.o.spell = not vim.o.spell
    print("spell: " .. tostring(vim.o.spell))
end)

vim.g.tmux_navigator_no_mappings = 1
vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-\\>', ':TmuxNavigatePrevious<CR>', {silent = true})


