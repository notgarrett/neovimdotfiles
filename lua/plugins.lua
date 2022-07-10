local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

vim.cmd[[
  filetype plugin indent on 
  ]]

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
local vim = vim
require('packer').startup(function(use)
 	use "wbthomason/packer.nvim"


use ({ 
    'lervag/vimtex',
    config = require("config.vimtex"),
--    ft = 'tex'
})


  use 'neovim/nvim-lspconfig' 
  
  use ({'hrsh7th/nvim-cmp',
   requires={'hrsh7th/cmp-nvim-lsp','saadparwaiz1/cmp_luasnip','hrsh7th/cmp-buffer','hrsh7th/cmp-path','hrsh7th/cmp-cmdline'},
  config = require("config.cmp")})
  
 --[[     use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    ]]--

    use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = require("config.startup")
  }


use {'mhinz/neovim-remote',
requires={'lervag/vimtex'}}

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'},
  config = require("config.telescope")  

}
}

    use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = require("config.tree")
    --tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use ({"sar/luasnip.nvim",
    requires={"rafamadriz/friendly-snippets"}, 
   config=require("config.luasnip")})


  use ({'Mofiqul/dracula.nvim',
  config = require("config.dracula")})

  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = require("config.lualine")
}

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = require("config.tabline")}

  use {
    "williamboman/nvim-lsp-installer",
    requires = {"neovim/nvim-lspconfig"},
    config = require("config.lspinstaller")
}


 if packer_bootstrap then
  require('packer').sync()
 end
end)
