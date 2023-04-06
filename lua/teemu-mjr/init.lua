require("teemu-mjr.set")
require("teemu-mjr.mappings")
require("teemu-mjr.packer")

-- higlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
})

-- tab width overrideing
vim.g.taboverride = 0
function Tabo(num)
    vim.g.taboverride = num
    vim.opt.tabstop = vim.g.taboverride
    vim.opt.softtabstop = vim.g.taboverride
    vim.opt.shiftwidth = vim.g.taboverride
end
