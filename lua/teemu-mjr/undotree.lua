local nnoremap = require("teemu-mjr.remap").nnoremap

nnoremap("<leader>u", ":UndotreeToggle<CR>")

vim.g.undotree_WindowLayout = 4

vim.cmd([[
if has("persistent_undo")
let target_path = expand('~/.undodir')

if !isdirectory(target_path)
call mkdir(target_path, "p", 0700)
endif

let &undodir=target_path
set undofile
endif
]])
