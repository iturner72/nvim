local avante = require("avante")

avante.setup({
  provider = "claude",
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-sonnet-20240620",
    temperature = 0,
    max_tokens = 4096,
  },
  behavior = {
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },
  mappings = {
    diff = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>"
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
  },
  hints = { enabled = true },
  windows = {
    position = "right",
    wrap = true,
    width = 40,
    sidebar_header = {
      align = "center",
      rounded = true,
    },
  },
  highlights = {
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  diff = {
    autojump = true,
    list_opener = "copen",
  },
})

-- Custom keymaps
vim.keymap.set("n", "<leader>aa", function() avante.toggle() end, { desc = "Toggle Avante sidebar" })
vim.keymap.set("n", "<leader>ar", function() avante.refresh() end, { desc = "Refresh Avante sidebar" })
vim.keymap.set("n", "<leader>ae", function() avante.edit() end, { desc = "Edit selected blocks with Avante" })

-- Load Avante lib (recommended to be called after setting colorscheme)
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    require('avante_lib').load()
  end,
})

-- Set the API key for Claude
if vim.env.ANTHROPIC_API_KEY then
  vim.g.avante_claude_api_key = vim.env.ANTHROPIC_API_KEY
else 
  vim.notify("ANTHROPIC_API_KEY is not set in the environment. Avante may not function correctly.", vim.log.levels.WARN)
end
