vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")

vim.g.fugitive_blame_format = '%(author_time:%Y-%m-%d %H:%M:%S) %(committer_time:%Y-%m-%d %H:%M:%S) %(author) %(committer) %s'
