local keymap = require("teemu-mjr.keymap")
-- normal
local nnoremap = keymap.nnoremap
-- visual
local vnoremap = keymap.vnoremap
-- visual block
local xnoremap = keymap.xnoremap
-- insert
local inoremap = keymap.inoremap
local onoremap = keymap.onoremap

-- Normal --
-- Open NvimTree
nnoremap("<leader>e", "<cmd>NvimTreeFocus<CR>")
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

-- Visual --
-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")

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
-- Diff
nnoremap("<leader>gd", ":Gitsigns diffthis<CR>")

-- COC --
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap("[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
nnoremap("]g", "<Plug>(coc-diagnostic-next)", { silent  = true })
-- GoTo code navigation.
nnoremap("gd", "<Plug>(coc-definition)", { silent = true })
nnoremap("gy", "<Plug>(coc-type-definition)", { silent = true })
nnoremap("gi", "<Plug>(coc-implementation)", { silent = true })
nnoremap("gr", "<Plug>(coc-references)", { silent = true })
-- Use K to show documentation in preview window.
nnoremap("K", ":call ShowDocumentation()<CR>", { silent = true })
-- Symbol renaming.
nnoremap("<leader>rn", "<Plug>(coc-rename)")
-- Formatting selected code.
nnoremap("<leader>f", "<Plug>(coc-format-selected)")
xnoremap("<leader>f", "<Plug>(coc-format-selected)")
-- Formatting whole document
nnoremap("<leader>F", "<Plug>(coc-format)")
-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
xnoremap("<leader>a", "<Plug>(coc-codeaction-selected)")
nnoremap("<leader>a", "<Plug>(coc-codeaction-selected)")
-- Renoremap("keys for applying codeAction to the current buffer.
nnoremap("<leader>ac", "<Plug>(coc-codeaction)")
-- Apply AutoFix to problem on the current line.
nnoremap("<leader>qf", "<Plug>(coc-fix-current)")
-- Run the Code Lens action on the current line.
nnoremap("<leader>cl", "<Plug>(coc-codelens-action)")
-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xnoremap("if", "<Plug>(coc-funcobj-i)")
onoremap("if", "<Plug>(coc-funcobj-i)")
xnoremap("af", "<Plug>(coc-funcobj-a)")
onoremap("af", "<Plug>(coc-funcobj-a)")
xnoremap("ic", "<Plug>(coc-classobj-i)")
onoremap("ic", "<Plug>(coc-classobj-i)")
xnoremap("ac", "<Plug>(coc-classobj-a)")
onoremap("ac", "<Plug>(coc-classobj-a)")
-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
nnoremap("<C-s>", "<Plug>(coc-range-select)", { silent = true })
xnoremap("<C-s>", "<Plug>(coc-range-select)", { silent = true })
