return {
  'folke/lazy.nvim',
  'wbthomason/packer.nvim', -- Keep Packer temporarily for smooth transition
  'folke/tokyonight.nvim',
  'nvim-lua/plenary.nvim',
  {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
  {'edeneast/nightfox.nvim', name = 'nightfox', config = function() vim.cmd('colorscheme terafox') end},
  {'pwntester/octo.nvim', dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'nvim-tree/nvim-web-devicons'}},
  {'yacineMTB/dingllm.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
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
  {'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
  -- add extra deps here later
}