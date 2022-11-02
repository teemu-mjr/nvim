local Remap = require("teemu-mjr.remap")
-- normal
local nnoremap = Remap.nnoremap
-- visual
local vnoremap = Remap.vnoremap
-- visual block
local xnoremap = Remap.xnoremap
-- insert
-- local inoremap = Remap.inoremap

-- normal --
-- open neotree
nnoremap("<leader>e", "<cmd>Neotree<CR>")
-- buffer
nnoremap("<leader>c", "<cmd>BD<CR>")
nnoremap("<leader>C", "<cmd>BD!<CR>")
nnoremap("<leader>bl", "<cmd>buffers<CR>")
-- better window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
-- resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")
-- navigate buffers
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")
-- split
nnoremap("<leader>sx", ":split<CR>")
nnoremap("<leader>sv", ":vsplit<CR>")
-- center cursor
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
-- copy to clipboard
nnoremap("<leader>y", '"+y')
-- paste from clipboard
nnoremap("<leader>p", '"+p')

-- visual --
-- stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- copy to clipboard
vnoremap("<leader>y", '"+y')

-- visual block --
-- move text up and down
xnoremap("J", ":move '>+1<CR>gv-gv")
xnoremap("K", ":move '<-2<CR>gv-gv")
xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
xnoremap("<A-k>", ":move '<-2<CR>gv-gv")

-- gitsigns --
-- move between hunks
nnoremap("<leader>gj", ":Gitsigns next_hunk<CR>")
nnoremap("<leader>gk", ":Gitsigns prev_hunk<CR>")
-- blame
nnoremap("<leader>gb", ":Gitsigns blame_line<CR>")
nnoremap("<leader>gB", ":Gitsigns toggle_current_line_blame<CR>")
-- highlight
nnoremap("<leader>gh", ":Gitsigns toggle_linehl<CR>")
-- reset hunk
nnoremap("<leader>gr", ":Gitsigns reset_hunk<CR>")
nnoremap("<leader>gR", ":Gitsigns reset_buffer<CR>")
-- diff
nnoremap("<leader>gd", ":Gitsigns diffthis<CR>")
-- undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")

-- telescope --
nnoremap("<leader>lf", ":Telescope find_files<cr>")
nnoremap("<leader>lg", ":Telescope live_grep<cr>")
nnoremap("<leader>lb", ":Telescope buffers<cr>")
nnoremap("<leader>lh", ":Telescope help_tags<cr>")
