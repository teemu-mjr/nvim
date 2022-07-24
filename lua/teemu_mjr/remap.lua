local nnoremap = require("teemu_mjr.keymap").nnoremap

-- Open NvimTree
nnoremap("<leader>e", "<cmd>NvimTreeFocus<CR>")

-- Close buffer
nnoremap("<leader>c", "<cmd>BD<CR>")

-- Normal --
-- Better window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")

-- Move text up and down
nnoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
nnoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
