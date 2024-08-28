local avante = require('avante')

avante.setup({
  provider = "claude",
  claude = {
    model = "claude-3-5-sonnet-20240620",
    temperature = 0,
    max_tokens = 4096,
  },
  openai = {
    model = "gpt-4o",
    temperature = 0,
    max_tokens = 4096,
  },
  behaviour = {
    auto_set_highlight_group = true,
    auto_apply_diff_after_generation = false,
  },
  mappings = {
    ask = "<leader>aa",
    refresh = "<leader>ar",
  },
  windows = {
    wrap = true,
    width = 40,
  },
})
