return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context")

    use({
        "neovim/nvim-lspconfig",
        requires = {
            -- lsp support
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- null-ls
            { "jose-elias-alvarez/null-ls.nvim" },

            -- autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },

            -- snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

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

    use("akinsho/toggleterm.nvim")

    use("nvim-lualine/lualine.nvim")
    use("lewis6991/gitsigns.nvim")

    use("numToStr/Comment.nvim")

    -- Theme
    use("joshdick/onedark.vim")
end)
