vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt_local.formatoptions:remove("o")
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.hl_op({ higroup = "Visual", timeout = 100 })
    end,
})
