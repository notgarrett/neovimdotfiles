--- Generated by Luanalysis
--- Created by garrettg.
--- DateTime: 2023-05-07 10:10 p.m.
---


local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" }


  --------------------------------------------------

  -- LSP Setup
  use { 'neovim/nvim-lspconfig',  -- Collection of configurations for built-in LSP client
    requires = { 'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "lvimuser/lsp-inlayhints.nvim",
      "kdheepak/cmp-latex-symbols",
      -- "PaterJason/cmp-conjure"
    },
    srouces = {
      {
        name = "latex_symbols",
        option = {
          strategy = 0, -- mixed
        },
      },
    },
    config = function()
      require('config.cmp');
    end } -- Snippets plugin


  --------------------------------------------------

  -- Mason Setup
  use {
    "williamboman/mason.nvim",
    requires = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      --require("config.mason")
    end,
    run = ":MasonUpdate", -- :MasonUpdate updates registry contents

  }

  --------------------------------------------------
  -- Clojure Based Plugins
  --
  -- use {
  --   'Olical/conjure',
  -- }
  --
  --
  -- use { 'luochen1990/rainbow',
  --   ft = { 'clojure' } }
  --
  --------------------------------------------------

  -- Rust things
  use { 'simrat39/rust-tools.nvim',
    config = function()
    end
  }

  --------------------------------------------------
  use {
    'numToStr/Comment.nvim',
    config = function()
      require("config.comment")
    end
  }

  use { "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("config.catpuccin")
    end

  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("config.which-key")
    end
  }

  use { 'lewis6991/impatient.nvim',
    config = function()
      require("impatient")
    end }

  use {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("config.startup")
    end
  }

  use { 'romgrk/barbar.nvim', requires = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  }, config = function()
    require("config.barbar")
  end }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require("config.lualine")
    end
  }
  use { "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("config.toggleterm")
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' }
    },
    config = function() require("config.telescope") end
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("config.file-browser")
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
      require("config.gitsigns")
    end
  }

  use { "nvim-tree/nvim-tree.lua",
    requires = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
      require("config.nvim-tree")
    end
  }

  use { "moll/vim-bbye" }
  use { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run =
  'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use { 'ggandor/leap.nvim',
    requires = { { "tpope/vim-repeat" } },
    config = function()
      require('leap').add_default_mappings()
    end

  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("config.auto_pairs") end
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.nullls")
    end
  }

  use { 'mfussenegger/nvim-dap',
    config = function()
      require("config.dap")
    end
  }

  use { "rcarriga/nvim-notify" } -- optional
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
