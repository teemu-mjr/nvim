require("teemu-mjr.set")
require("teemu-mjr.mappings")
require("teemu-mjr.lazy")

-- higlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
})
