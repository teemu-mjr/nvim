return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    init = function()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {},
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = {},
            },
            indent = {
                enable = true,
                disable = {},
            },
            modules = {},
        })
    end,
}
