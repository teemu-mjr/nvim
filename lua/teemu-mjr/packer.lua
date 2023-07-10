return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("folke/neodev.nvim")

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context")

    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })

    -- lsp
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
        run = ":MasonUpdate"
    }
    -- cmp
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    -- snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- java
    use("mfussenegger/nvim-jdtls")

    -- git
    use({
        "NeoGitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "kyazdani42/nvim-web-devicons"
        },
    })
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- dap
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- gol
    use("mbbill/undotree")
    use("tpope/vim-surround")
    use("windwp/nvim-ts-autotag")
    use("numToStr/Comment.nvim")

    -- style
    use("navarasu/onedark.nvim")
    use("nvim-lualine/lualine.nvim")
end)
