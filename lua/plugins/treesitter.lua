return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ignore_install = {},
            autotag = {
                enable = true,
                disable = {},
                module_path = "nvim-ts-autotag.internal",
            },
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = {},
            },
            indent = {
                enable = true,
                disable = {},
            },
        })

        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
}
