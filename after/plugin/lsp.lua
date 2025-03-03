local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.configure('rust_analyzer', {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        allFeatures = true,
      },
      procMacro = {
        enable = true,
--        ignored = {
--            ["leptos-macro"] = {"server"}
--        }
      },
      cargo = {
        allFeatures = true,
        autoreload = true
      },
      rustfmt = {
        overrideCommand = {"leptosfmt", "--stdin", "--rustfmt"}
      },
      inlayHints = {
        enable = true,
        typeHints = true,
        parameterHints = true,
      },
      lens = {
        enable = true,
        references = true,
        implementations = true,
        enumVariantReferences = true,
        methodReferences = true,
      },
      hoverActions = {
        enable = true
      },
      callInfo = {
        full = true
      },
    }
  }
})

lsp.configure('pylsp', {
  settings = {
    pylsp = {
      configurationSources = {'flake8'},
      plugins = {
        pyflakes = {enabled = false},  -- Disable Pyflakes if using Flake8
        pycodestyle = {enabled = false},
        flake8 = {enabled = false},
        ruff = {enabled = false}
      }
    }
  }
})

require('lspconfig').ruff.setup({
  on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
  end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
  }
)

lsp.set_preferences({
	sign_icons = { }
})


lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.rs"},
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
