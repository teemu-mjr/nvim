vim.api.nvim_create_autocmd("FileType *", {
    callback = function()
        vim.opt.formatoptions = "jrql"
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
})

vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    desc = "Custom netrw keymaps",
    callback = function()
        vim.keymap.set("n", "o", "<cr>", { remap = true, buffer = true })
    end,
})
