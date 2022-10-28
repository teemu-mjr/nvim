local Remap = require("teemu-mjr.remap")
-- normal
local nnoremap = Remap.nnoremap
-- visual
local vnoremap = Remap.vnoremap
-- visual block
local xnoremap = Remap.xnoremap
-- insert
local inoremap = Remap.inoremap

-- Normal --
-- Open Neotree
nnoremap("<leader>e", "<cmd>Neotree<CR>")
-- Buffer
nnoremap("<leader>c", "<cmd>BD<CR>")
nnoremap("<leader>C", "<cmd>BD!<CR>")
nnoremap("<leader>bl", "<cmd>buffers<CR>")
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
-- Split
nnoremap("<leader>ss", ":split<CR>")
nnoremap("<leader>si", ":vsplit<CR>")
-- Center cursor
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Visual --
-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- Copy to clipboard
vnoremap("<C-c>", "\"+y")

-- Visual Block --
-- Move text up and down
xnoremap("J", ":move '>+1<CR>gv-gv")
xnoremap("K", ":move '<-2<CR>gv-gv")
xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
xnoremap("<A-k>", ":move '<-2<CR>gv-gv")

-- Insert --
-- Move to end of line in input mode
inoremap("<C-a>", "<esc>A")

-- GitSigns --
-- Move between hunks
nnoremap("<leader>gj", ":Gitsigns next_hunk<CR>")
nnoremap("<leader>gk", ":Gitsigns prev_hunk<CR>")
-- Blame
nnoremap("<leader>gb", ":Gitsigns blame_line<CR>")
nnoremap("<leader>gB", ":Gitsigns toggle_current_line_blame<CR>")
-- Highlight
nnoremap("<leader>gh", ":Gitsigns toggle_linehl<CR>")
-- Reset hunk
nnoremap("<leader>gr", ":Gitsigns reset_hunk<CR>")
nnoremap("<leader>gR", ":Gitsigns reset_buffer<CR>")
-- Diff
nnoremap("<leader>gd", ":Gitsigns diffthis<CR>")

-- TELESCOPE --
nnoremap("<leader>lf", ":Telescope find_files<cr>")
nnoremap("<leader>lg", ":Telescope live_grep<cr>")
nnoremap("<leader>lb", ":Telescope buffers<cr>")
nnoremap("<leader>lh", ":Telescope help_tags<cr>")
