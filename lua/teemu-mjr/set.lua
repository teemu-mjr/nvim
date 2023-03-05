vim.opt.guicursor = ""
vim.g.mapleader = " "

vim.opt.mouse = "a"

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldlevelstart = 99

vim.opt.splitright = true

-- vim.opt.winbar = "%t"
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.encoding = "utf8"
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.g.nowritebackup = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.netrw_use_errorwindow = 0
vim.g.netrw_banner = 0
vim.g.netrw_hide = 1
vim.cmd([[
let g:netrw_list_hide = netrw_gitignore#Hide()
]])
vim.g.netrw_localcopydircmd = "cp -r"

-- higlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
})

vim.g.taboverride = 0
function Tabo(num)
    vim.g.taboverride = num
    vim.opt.tabstop = vim.g.taboverride
    vim.opt.softtabstop = vim.g.taboverride
    vim.opt.shiftwidth = vim.g.taboverride
end
