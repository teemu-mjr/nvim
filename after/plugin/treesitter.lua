require("nvim-treesitter.configs").setup({
    ensure_installed = {},
    auto_install = true,
    ignore_install = { "gitignore" },
    autotag = {
        enable = true,
        disable = {},
        module_path = "nvim-ts-autotag.internal",
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = { "php" },
    },
    indent = {
        enable = true,
        disable = { "html" },
    },
})

-- Automatic folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
