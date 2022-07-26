vim.opt.guicursor = ""
vim.g.mapleader = " "

vim.opt.mouse = "a"

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true
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

-- higlight on yank
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 100 })
]])
