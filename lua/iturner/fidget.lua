return function()
  require("fidget").setup({
    -- Progress
    progress = {
      poll_rate = 0, -- Default value, update on each event
      suppress_on_insert = false,
      ignore_done_already = false,
      ignore_empty_message = true,
      clear_on_detach = function(client_id)
        local client = vim.lsp.get_client_by_id(client_id)
        return client and client.name or nil
      end,
      notification_group = function(msg)
        return msg.lsp_client.name
      end,
      
      -- Display
      display = {
        done_icon = "✔",
        done_style = "Constant",
        progress_icon = { pattern = "dots", period = 1 },
        progress_style = "WarningMsg",
        group_style = "Title",
        icon_style = "Question",
        priority = 30,
        skip_history = true,
        format_message = function(msg)
          local message = msg.message or (msg.done and "Completed" or "In progress...")
          if msg.percentage then
            message = string.format("%s (%.0f%%)", message, msg.percentage)
          end
          return message
        end,
        format_annote = function(msg)
          return msg.title
        end,
        format_group_name = tostring,
        overrides = {
          rust_analyzer = {
            name = "Rust Analyzer",
            icon = "🦀",
          },
        },
      },

      -- LSP
      lsp = {
        progress_ringbuf_size = 0, -- Default value, let Neovim decide
      },
    },

    -- Notification
    notification = {
      poll_rate = 10,
      filter = vim.log.levels.INFO,
      history_size = 128,
      override_vim_notify = false,
      configs = {
        default = require("fidget.notification").default_config,
      },
      view = {
        stack_upwards = true,
        icon_separator = " ",
        group_separator = "---",
        group_separator_hl = "Comment",
      },
      window = {
        normal_hl = "Comment",
        winblend = 100,
        border = "none",
        zindex = 45,
        max_width = 0,  -- No maximum width
        max_height = 0, -- No maximum height
        x_padding = 1,
        y_padding = 0,
        align = "bottom",
        relative = "editor",
      },
    },

    -- Integration
    integration = {
      ["nvim-tree"] = {
        enable = true,
      },
    },

    -- Logger
    logger = {
      level = vim.log.levels.WARN,
      max_size = 10000, -- 10MB log size
      float_precision = 0.01,
      path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
    },
  })
end
