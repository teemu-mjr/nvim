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
