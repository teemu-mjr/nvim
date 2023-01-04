return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context")

    -- lsp
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })
    -- null-ls
    use("jose-elias-alvarez/null-ls.nvim")
    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    -- snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

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

    use("tpope/vim-surround")
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    use("nvim-lualine/lualine.nvim")
    use("lewis6991/gitsigns.nvim")

    use("numToStr/Comment.nvim")

    -- Theme
    use("navarasu/onedark.nvim")
end)
