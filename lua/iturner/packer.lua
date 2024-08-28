-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'edeneast/nightfox.nvim',
	  as = 'nightfox',
	  config = function()
		  vim.cmd('colorscheme terafox')
	  end
  })

  use {
      'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        }
  }

  use {
    'yacineMTB/dingllm.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
    end
  }

  use {
    'yetone/avante.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      {
        'MeanderingProgrammer/render-markdown.nvim',
        config = function()
          require('render-markdown').setup({
            file_types = { "markdown", "Avante" },
          })
        end,
      },
    },
    config = function()
      require('avante.config')
    end,
    run = 'make', -- Optional, only if you want to use tiktoken_core to calculate tokens count
  }

  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup({
        text = {
          spinner = "pipe",         -- animation shown when tasks are ongoing
          done = "✔",               -- character shown when all tasks are complete
          commenced = "Started",    -- message shown when task starts
          completed = "Completed",  -- message shown when task completes
        },
        align = {
          bottom = true,            -- align fidgets along bottom edge of buffer
          right = true,             -- align fidgets along right edge of buffer
        },
        timer = {
          spinner_rate = 125,       -- frame rate of spinner animation, in ms
          fidget_decay = 2000,      -- how long to keep around empty fidget, in ms
          task_decay = 1000,        -- how long to keep around completed task, in ms
        },
        window = {
          relative = "win",         -- where to anchor, either "win" or "editor"
          blend = 100,              -- &winblend for the window
          zindex = nil,             -- the zindex value for the window
          border = "none",          -- style of border for the fidget window
        },
        fmt = {
          leftpad = true,           -- right-justify text in fidget box
          stack_upwards = true,     -- list of tasks grows upwards
          max_width = 0,            -- maximum width of the fidget box
          fidget =                  -- function to format fidget title
            function(fidget_name, spinner)
              return string.format("%s %s", spinner, fidget_name)
            end,
          task =                    -- function to format each task line
            function(task_name, message, percentage)
              return string.format(
                "%s%s [%s]",
                message,
                percentage and string.format(" (%s%%)", percentage) or "",
                task_name
              )
            end,
        },
        sources = {                 -- Sources to configure
          ['*'] = {                 -- Name of source
            ignore = false,         -- Ignore notifications from this source
          },
        },
        debug = {
          logging = false,          -- whether to enable logging, for debugging
          strict = false,           -- whether to interpret LSP strictly
        },
      })
    end
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('WhoIsSethDaniel/toggle-lsp-diagnostics.nvim')
  use('lervag/vimtex')
  use('christoomey/vim-tmux-navigator')
  use('keith/swift.vim')
  use('rayliwell/tree-sitter-rstml')
  -- use('yacineMTB/ding')

  use {
	  'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  -- Snippet Collection (Optional)
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)
