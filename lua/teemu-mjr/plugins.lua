return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use{"neoclide/coc.nvim", branch = "release"}
    use{"nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { {'nvim-lua/plenary.nvim'} }}
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        }
      }
    use("nvim-treesitter/nvim-treesitter")
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use("lewis6991/gitsigns.nvim")
    use("akinsho/bufferline.nvim")
    use("akinsho/toggleterm.nvim")
    use("folke/which-key.nvim")
    use("nvim-lualine/lualine.nvim")
    use("numToStr/Comment.nvim")
    use("tpope/vim-surround")
    use("qpkorr/vim-bufkill")
    use("joshdick/onedark.vim")
    use("terryma/vim-multiple-cursors")
    use("nvim-treesitter/nvim-treesitter-context")
end)
