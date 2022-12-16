return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Completion
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("onsails/lspkind.nvim")

    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("jose-elias-alvarez/null-ls.nvim")

    -- Snippets
    use("L3MON4D3/LuaSnip")

    --
    use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })
    use({
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
        config = function()
            require("window-picker").setup()
        end,
    })
    use("mbbill/undotree")
    use({
        "TimUntersberger/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
    })
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use("akinsho/toggleterm.nvim")
    use("nvim-lualine/lualine.nvim")
    use("numToStr/Comment.nvim")
    use("tpope/vim-surround")

    -- Visual
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-treesitter-context")
    use("lewis6991/gitsigns.nvim")
    use("akinsho/bufferline.nvim")
    -- Theme
    -- use("folke/tokyonight.nvim")
    use("joshdick/onedark.vim")
end)
