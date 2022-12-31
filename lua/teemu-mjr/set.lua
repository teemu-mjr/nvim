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

vim.g.netrw_banner = 1
vim.g.netrw_hide = 1
vim.cmd([[
let g:netrw_list_hide = netrw_gitignore#Hide()
]])
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ",\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"

-- quit if last buffer is a nofile buffer
vim.cmd([[
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="nofile"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction
]])

-- higlight on yank
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 100 })
]])
