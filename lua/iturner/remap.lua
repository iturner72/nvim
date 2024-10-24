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

-- broken toggle
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
    print("formatting complete")
end, { desc = "format file" })

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- tmux vim keybindings for switching panes
vim.g.tmux_navigator_no_mappings = 1
vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-\\>', ':TmuxNavigatePrevious<CR>', {silent = true})

local luasnip = require("luasnip")

-- Expand snippets in insert mode with Tab
vim.keymap.set("i", "<Tab>", function()
  if luasnip.expandable() then
    return "<Plug>luasnip-expand-snippet"
  else
    return "<Tab>"
  end
end, { expr = true, silent = true })

-- Jump forward through tabstops in insert and visual mode with Control-[
vim.keymap.set({"i", "s"}, "<C-[>", function()
  if luasnip.jumpable(1) then
    return "<Plug>luasnip-jump-next"
  else
    return "<C-[>"
  end
end, { expr = true, silent = true })

-- Jump backward through tabstops in insert and visual mode with Shift-Tab
vim.keymap.set({"i", "s"}, "<S-Tab>", function()
  if luasnip.jumpable(-1) then
    return "<Plug>luasnip-jump-prev"
  else
    return "<S-Tab>"
  end
end, { expr = true, silent = true })

-- Use treesitter for folding when available
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python", "rust"},
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
  end
})

-- Adjust fold settings for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldnestmax = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.foldnestmax = 2
  end
})

-- Code folding keymaps
vim.keymap.set("n", "<leader>za", "za", { desc = "Toggle fold under cursor" })
vim.keymap.set("n", "<leader>zo", "zo", { desc = "Open fold under cursor" })
vim.keymap.set("n", "<leader>zc", "zc", { desc = "Close fold under cursor" })
vim.keymap.set("n", "<leader>zR", "zR", { desc = "Open all folds" })
vim.keymap.set("n", "<leader>zM", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "<leader>zj", "zj", { desc = "Move to next fold" })
vim.keymap.set("n", "<leader>zk", "zk", { desc = "Move to previous fold" })
vim.keymap.set("n", "<leader>zd", "zd", { desc = "Delete fold under cursor" })
vim.keymap.set("n", "<leader>zE", "zE", { desc = "Eliminate all folds in the window" })

-- Function to toggle folding
local function toggle_fold_column()
    if vim.wo.foldcolumn == '0' then
        vim.wo.foldcolumn = '4'
    else
        vim.wo.foldcolumn = '0'
    end
end

vim.keymap.set("n", "<leader>zf", toggle_fold_column, { desc = "Toggle fold column" })

-- Toggle between manual and syntax based folds
local function toggle_fold_method()
    if vim.wo.foldmethod == 'indent' then
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
        print("Fold method: Treesitter")
    else 
        vim.wo.foldmethod = 'indent'
        print("Fold method: indent")
    end
end

vim.keymap.set("n", "<leader>zt", toggle_fold_method, { desc = "Toggle fold method" })

-- Quickfix list navigation
vim.keymap.set("n", "<C-[>", ":cprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", ":cnext<CR>", { noremap = true, silent = true })
