local M = {}

M.setup = function()
  local lspconfig = require('lspconfig')
  
  lspconfig.rust_analyzer.setup({
    settings = {
      ["rust-analyzer"] = {
        rustfmt = {
          overrideCommand = {"leptosfmt", "--stdin", "--rustfmt"}
        },
      }
    }
  })

  -- Autoformat on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end

return M
