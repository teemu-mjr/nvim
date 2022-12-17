require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    ignore_install = {},
    auto_install = false,
    autotag = {
        disable = {},
        enable = true,
        module_path = "nvim-ts-autotag.internal",
    },
    highlight = {
        additional_vim_regex_highlighting = true,
        custom_captures = {},
        disable = {},
        enable = true,
        loaded = false,
        module_path = "nvim-treesitter.highlight",
    },
    indent = {
        disable = {},
        enable = true,
        loaded = true,
    },
})

-- Automatic folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
