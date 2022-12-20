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
local function closeBuffer()
    local fileStatus = vim.api.nvim_command_output("file")
    if string.find(fileStatus, "Modified") then
        print("You have unsaved changes!")
    else
        vim.cmd([[bp|sp|bn|bd]])
    end
end

nnoremap("<leader>c", closeBuffer)
nnoremap("<leader>C", ":bp|sp|bn|bd!<CR>")
nnoremap("<leader>bl", ":buffers<CR>")
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

-- visual --
-- stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- copy to clipboard
vnoremap("<leader>y", '"+y')
-- delete to clipboard
vnoremap("<leader>d", '"+d')
-- run selection with bash
vnoremap("<leader>tb", ":w !bash<CR>", { silent = true })
-- find and replace
vnoremap("<leader>rr", '"hy:%s/<C-r>h//gc<left><left><left>')

-- visual block --
-- move text up and down
xnoremap("J", ":move '>+1<CR>gv=gv")
xnoremap("K", ":move '<-2<CR>gv=gv")
xnoremap("<A-j>", ":move '>+1<CR>gv=gv")
xnoremap("<A-k>", ":move '<-2<CR>gv=gv")
