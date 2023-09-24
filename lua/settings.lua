vim.g.mapleader = " "
vim.g.omni_sql_no_default_maps = 1
vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.colorcolumn = "80"
vim.opt.encoding = "utf8"
vim.opt.errorbells = false
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.guicursor = ""
vim.opt.hidden = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = "tab:| ,trail:·,extends:❯,precedes:❮"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.textwidth = 80
vim.opt.timeoutlen = 1000
vim.opt.winbar = "%#NormalFloat#%< %t %m%=%y"
vim.opt.wrap = false
vim.opt.writebackup = false

-- indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_use_errorwindow = 0
