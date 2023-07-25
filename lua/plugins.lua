-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { "onsails/lspkind-nvim", event = "VimEnter" }
  -- auto-completion engine
  use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }
  use { "hrsh7th/cmp-vsnip", after = "nvim-cmp" }   
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  if vim.g.is_mac then
    use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
  end

  use { "nvim-tree/nvim-web-devicons", event = "VimEnter" }

  use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      cond = firenvim_not_active,
      config = [[require('config.statusline')]],
  }

  -- fancy start screen
  use { "nvimdev/dashboard-nvim", event = "VimEnter",
    cond = firenvim_not_active,
    config = [[require('config.dashboard-nvim')]]
  }

  use {
      "lukas-reineke/indent-blankline.nvim",
      event = "VimEnter",
      config = [[require('config.indent-blankline')]],
  }
  -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
  use { "neovim/nvim-lspconfig"}
  -- for quick lsp support and language package management
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
  -- markdown support
  use {'iamcco/markdown-preview.nvim'}
  -- latex support
  use { "lervag/vimtex", ft = { "tex" } }

  use {"simrat39/rust-tools.nvim"}

  -- Asynchronous command execution
  use { "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" } }

  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    run = ":TSUpdate",
    config = [[require('config.treesitter')]],
  }

  -- file explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = [[require('config.nvim-tree')]],
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Git command inside vim
  use { "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('config.fugitive')]] }
  -- Better git log display
  use { "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } }
  use { "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = { "Conflicted" } }
  use {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "User InGitRepo",
    config = [[require('config.git-linker')]],
  }
  -- Show git change (change, delete, add) signs in vim sign column
  use { "lewis6991/gitsigns.nvim", config = [[require('config.gitsigns')]] }
  -- Better git commit experience
  use { "rhysd/committia.vim", opt = true, setup = [[vim.cmd('packadd committia.vim')]] }
  -- The missing auto-completion for cmdline!
  use { "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] }

  -- showing keybindings
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("config.which-key")
      end, 2000)
    end,
  }
  -- Better Escaping Plugins
  use {'jdhao/better-escape.vim', event = 'InsertEnter'}
  -- DAP
  use {'mfussenegger/nvim-dap'}
  -- DAP UI
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } 

  -- ColorScheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })
end)
