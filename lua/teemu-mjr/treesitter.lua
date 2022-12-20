require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    auto_install = true,
    autotag = {
        disable = {},
        enable = true,
        module_path = "nvim-ts-autotag.internal",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
