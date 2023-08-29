local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/neodev.nvim",
    "nvim-lua/plenary.nvim",

    "nvim-telescope/telescope.nvim",

    {
        "nvim-treesitter/nvim-treesitter",
        cmd = "TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "windwp/nvim-ts-autotag",
        }
    },

    {
        "williamboman/mason.nvim",
        cmd = "MasonUpdate",
        dependencies = {
            "neovim/nvim-lspconfig",
            "jose-elias-alvarez/null-ls.nvim",
            "williamboman/mason-lspconfig.nvim",
        }
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        }
    },

    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        }
    },

    "mbbill/undotree",
    "tpope/vim-surround",
    "numToStr/Comment.nvim",

    "navarasu/onedark.nvim",
    "nvim-lualine/lualine.nvim",

    "mfussenegger/nvim-jdtls",
})
