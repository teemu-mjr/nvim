vim.opt.background = "dark"

vim.cmd[[silent! colorscheme onedark]]

vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal termbg=#000030 termfg=#ffffff
        autocmd colorscheme * :hi Directory ctermfg=#ffffff
    augroup END
]])

vim.o.termguicolors = true
