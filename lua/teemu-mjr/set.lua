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
vim.opt.textwidth = 80
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldlevelstart = 99
vim.api.nvim_create_autocmd("FileType *", {
    callback = function()
        vim.opt.formatoptions = "jrql"
    end
})

vim.opt.splitright = true

-- vim.opt.winbar = "%t"
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.encoding = "utf8"
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.timeoutlen = 1000
vim.opt.colorcolumn = "80"

vim.g.netrw_use_errorwindow = 0
vim.g.netrw_banner = 0
vim.g.netrw_hide = 1
vim.cmd([[
let g:netrw_list_hide = netrw_gitignore#Hide()
]])
vim.g.netrw_localcopydircmd = "cp -r"
