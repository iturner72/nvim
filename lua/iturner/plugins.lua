return {
  'folke/lazy.nvim',
  'folke/tokyonight.nvim',
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {'edeneast/nightfox.nvim', name = 'nightfox', config = function() vim.cmd('colorscheme terafox') end},
  {'pwntester/octo.nvim', dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'nvim-tree/nvim-web-devicons'}},
  {'yacineMTB/dingllm.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
      end,
  },
  'nvim-treesitter/playground',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
  'lervag/vimtex',
  'christoomey/vim-tmux-navigator',
  'keith/swift.vim',
  {'VonHeikemen/lsp-zero.nvim', branch = 'v1.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  },
  {'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        vim.cmd('colorscheme nightfox')
      })
    end
  },
  {'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('nvim-web-devicons').setup {}
      require('iturner.lualine_config')()
    end
  },
  {
    'j-hui/fidget.nvim',
    tag = 'v1.4.5',
    config = function()
      require('iturner.fidget')()
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>o',
      function()
        require('oil').open()
      end,
      desc = '[F]ormat buffer', }
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- always pull latest changes
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
