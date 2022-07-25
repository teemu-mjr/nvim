return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("lunarvim/darkplus.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("qpkorr/vim-bufkill")
    use("akinsho/bufferline.nvim")
    use("tpope/vim-surround")
    use("numToStr/Comment.nvim")
    use("akinsho/toggleterm.nvim")
    use("folke/which-key.nvim")
    use("lewis6991/gitsigns.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-lualine/lualine.nvim")
    use{"neoclide/coc.nvim", branch = "release"}
end)
