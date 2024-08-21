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
        ignored = {
            ["leptos-macro"] = {"server"}
        }
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
        methodReferences = trhe,
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
        pycodestyle = {enabled = false},
        flake8 = {
          enabled = true,
          ignore = {'E501'},  -- Add this line to ignore the line too long error
        }
      }
    }
  }
})

lsp.setup()


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
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vfi", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vwi", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

local swift_lsp_group = vim.api.nvim_create_augroup("swift_lsp_group", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "swift" },
    callback = function()
        local root_dir = vim.fs.dirname(vim.fs.find({
            "Package.swift",
            ".git",
        }, { upward = true })[1])

        if root_dir then
            local client_id = vim.lsp.start({
                name = "sourcekit-lsp",
                cmd = { "sourcekit-lsp" },
                root_dir = root_dir,
                on_attach = function(_, bufnr)
                    -- Place any on_attach configurations here, if necessary
                end,
                -- Include any additional LSP settings or configurations here
            })

            -- Attach the LSP client to the current buffer
            if client_id then
                vim.lsp.buf_attach_client(0, client_id)
            end
        end
    end,
    group = swift_lsp_group,
})
