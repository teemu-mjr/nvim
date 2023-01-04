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
-- toggle file explorer
nnoremap("<leader>e", ":Rex<cr>", { silent = true })
vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    desc = "Custom netrm keymaps",
    callback = function()
        vim.keymap.set("n", "o", "<cr>", { remap = true, buffer = true })
    end,
})
-- toggle neogit
nnoremap("<leader>gG", ":Neogit<cr>")
-- toggle undotree
nnoremap("<leader>u", ":UndotreeToggle<cr>")
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
nnoremap("<leader>C", ":bp|sp|bn|bd!<cr>", { silent = true })
-- better window navigation
nnoremap("<c-h>", "<c-w>h")
nnoremap("<c-j>", "<c-w>j")
nnoremap("<c-k>", "<c-w>k")
nnoremap("<c-l>", "<c-w>l")
-- resize with arrows
nnoremap("<c-Up>", ":resize -2<cr>")
nnoremap("<c-Down>", ":resize +2<cr>")
nnoremap("<c-Left>", ":vertical resize -2<cr>")
nnoremap("<c-Right>", ":vertical resize +2<cr>")
-- center cursor
nnoremap("<c-d>", "<c-d>zz")
nnoremap("<c-u>", "<c-u>zz")
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
nnoremap("<leader>gj", ":Gitsigns next_hunk<cr>")
nnoremap("<leader>gk", ":Gitsigns prev_hunk<cr>")
-- blame
nnoremap("<leader>gb", ":Gitsigns blame_line<cr>")
nnoremap("<leader>gB", ":Gitsigns toggle_current_line_blame<cr>")
-- highlight
nnoremap("<leader>gh", ":Gitsigns toggle_linehl<cr>")
-- reset hunk
nnoremap("<leader>gr", ":Gitsigns reset_hunk<cr>")
nnoremap("<leader>gR", ":Gitsigns reset_buffer<cr>")
-- diff
nnoremap("<leader>gd", ":Gitsigns diffthis<cr>")

-- visual --
-- stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- copy to clipboard
vnoremap("<leader>y", '"+y')
-- delete without yank
vnoremap("<leader>d", '"_d')
-- run selection with bash
vnoremap("<leader>tb", ":w !bash<cr>", { silent = true })
-- find and replace
vnoremap("<leader>rr", '"hy:%s/<c-r>h//gc<left><left><left>')

-- visual block --
-- paste over without losing current
xnoremap("<leader>o", '"_dP')
-- move text up and down
xnoremap("J", ":move '>+1<cr>gv=gv")
xnoremap("K", ":move '<-2<cr>gv=gv")
xnoremap("<A-j>", ":move '>+1<cr>gv=gv")
xnoremap("<A-k>", ":move '<-2<cr>gv=gv")
