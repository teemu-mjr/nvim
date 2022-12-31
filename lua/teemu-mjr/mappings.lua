local Remap = require("teemu-mjr.remap")
-- normal
local nnoremap = Remap.nnoremap
-- visual
local vnoremap = Remap.vnoremap
-- visual block
local xnoremap = Remap.xnoremap
-- insert
local inoremap = Remap.inoremap

-- normal --
-- toggle file explorer
nnoremap("<leader>e", ":Rex<CR>")
vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    desc = "Custom netrm keymaps",
    callback = function()
        vim.keymap.set("n", "o", "<cr>", { remap = true, buffer = true })
    end,
})
-- toggle neogit
nnoremap("<leader>gG", ":Neogit<CR>")
-- toggle undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")
-- close buffer
local function closeBuffer()
    local fileStatus = vim.api.nvim_command_output("file")
    if string.find(fileStatus, "Modified") then
        print("You have unsaved changes!")
    else
        vim.api.nvim_command([[bp|sp|bn|bd]])
    end
end

nnoremap("<leader>c", closeBuffer)
nnoremap("<leader>C", ":bp|sp|bn|bd!<CR>", { silent = true })
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
-- center cursor
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")
-- copy to clipboard
nnoremap("<leader>y", '"+y')
-- paste from clipboard
nnoremap("<leader>p", '"+p')
-- paste up from clipboard
nnoremap("<leader>P", '"+P')
-- delete without yank
nnoremap("<leader>d", '"_d')
-- gitsign
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

-- visual --
-- stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- copy to clipboard
vnoremap("<leader>y", '"+y')
-- delete without yank
vnoremap("<leader>d", '"_d')
-- run selection with bash
vnoremap("<leader>tb", ":w !bash<CR>", { silent = true })
-- find and replace
vnoremap("<leader>rr", '"hy:%s/<C-r>h//gc<left><left><left>')

-- visual block --
-- paste over without losing current
xnoremap("<leader>o", '"_dP')
-- move text up and down
xnoremap("J", ":move '>+1<CR>gv=gv")
xnoremap("K", ":move '<-2<CR>gv=gv")
xnoremap("<A-j>", ":move '>+1<CR>gv=gv")
xnoremap("<A-k>", ":move '<-2<CR>gv=gv")

-- insert --
-- <C-c> for the win
inoremap("<C-c>", "<Esc>")
