------------
-- NORMAL --
------------

vim.keymap.set("n", "<leader>e", vim.cmd.Rexplore, {})
vim.keymap.set("n", "<leader>E", vim.cmd.Explore, {})

-- close buffer
local function closeBuffer()
    local fileStatus = vim.api.nvim_command_output("file")
    if string.find(fileStatus, "Modified") then
        print("You have unsaved changes!")
    else
        vim.api.nvim_command([[bp|sp|bn|bd]])
    end
end

-- unmaximize
vim.keymap.set("n", "<c-w>o", ":mksession! ~/session.vim<cr>:wincmd o<cr>", { silent = true })
vim.keymap.set("n", "<c-w>u", ":source ~/session.vim<cr>", { silent = true })

-- close buffer
vim.keymap.set("n", "<leader>c", closeBuffer, {})
vim.keymap.set("n", "<leader>C", ":bp|sp|bn|bd!<cr>", { silent = true })
-- qf list
vim.keymap.set("n", "<c-j>", "<cmd>cnext<cr>zz", {})
vim.keymap.set("n", "<c-k>", "<cmd>cprev<cr>zz", {})
vim.keymap.set("n", "<leader>j", "<cmd>lnext<cr>zz", {})
vim.keymap.set("n", "<leader>k", "<cmd>lprev<cr>zz", {})

-- center cursor
vim.keymap.set("n", "<c-d>", "<c-d>zz", {})
vim.keymap.set("n", "<c-u>", "<c-u>zz", {})
vim.keymap.set("n", "}", "}zz", {})
vim.keymap.set("n", "{", "{zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "*", "*zz", {})
vim.keymap.set("n", "#", "#zz", {})

-- copy to clipboard
vim.keymap.set("n", "<leader>y", '"+y', {})
-- paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', {})
-- paste up from clipboard
vim.keymap.set("n", "<leader>P", '"+P', {})
-- delete without yank
vim.keymap.set("n", "<leader>d", '"_d', {})

------------
-- VISUAL --
------------

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})
-- copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y', {})
-- paste from clipboard
vim.keymap.set("v", "<leader>p", '"+p', {})
-- delete without yank
vim.keymap.set("v", "<leader>d", '"_d', {})
-- replace from buffer
vim.keymap.set("v", "<leader>P", '"_dP', {})
-- run selection with bash
vim.keymap.set("v", "<leader>tb", ":w !bash<cr>", { silent = true })
-- find and replace
vim.keymap.set("v", "<leader>rn", '"hy:%s/<c-r>h/<c-r>h/gc<left><left><left>', {})

------------------
-- VISUAL BLOCK --
------------------

-- paste over without losing current
vim.keymap.set("x", "<leader>o", '"_dP', {})
-- move text up and down
vim.keymap.set("x", "J", ":move '>+1<cr>gv=gv", {})
vim.keymap.set("x", "K", ":move '<-2<cr>gv=gv", {})
vim.keymap.set("x", "<A-j>", ":move '>+1<cr>gv=gv", {})
vim.keymap.set("x", "<A-k>", ":move '<-2<cr>gv=gv", {})

------------
-- INSERT --
------------

vim.keymap.set("i", "<C-c>", "<esc>", {})
