------------
-- NORMAL --
------------

local function toggleNetrw()
    local ok, _ = pcall(vim.cmd.Rexplore)
    if not ok or string.match(vim.api.nvim_exec("1mess", {}), "not a former netrw window") then
        vim.api.nvim_command("Explore")
        print("Explore")
    end
end

vim.keymap.set("n", "<leader>e", toggleNetrw, { silent = true })
vim.keymap.set("n", "<leader>E", ":Explore<cr>", { silent = true })
vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    desc = "Custom netrw keymaps",
    callback = function()
        vim.keymap.set("n", "o", "<cr>", { remap = true, buffer = true })
    end,
})
-- toggle undotree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", {})
-- close buffer
local function closeBuffer()
    local fileStatus = vim.api.nvim_command_output("file")
    if string.find(fileStatus, "Modified") then
        print("You have unsaved changes!")
    else
        vim.api.nvim_command([[bp|sp|bn|bd]])
    end
end

vim.keymap.set("n", "<leader>c", closeBuffer, {})
vim.keymap.set("n", "<leader>C", ":bp|sp|bn|bd!<cr>", { silent = true })
-- resize with arrows
vim.keymap.set("n", "<c-Up>", ":resize -2<cr>", {})
vim.keymap.set("n", "<c-Down>", ":resize +2<cr>", {})
vim.keymap.set("n", "<c-Left>", ":vertical resize -2<cr>", {})
vim.keymap.set("n", "<c-Right>", ":vertical resize +2<cr>", {})
-- center cursor
vim.keymap.set("n", "<c-d>", "<c-d>zz", {})
vim.keymap.set("n", "<c-u>", "<c-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
-- copy to clipboard
vim.keymap.set("n", "<leader>y", '"+y', {})
-- paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', {})
-- paste up from clipboard
vim.keymap.set("n", "<leader>P", '"+P', {})
-- delete without yank
vim.keymap.set("n", "<leader>d", '"_d', {})
-- toggle neogit
vim.keymap.set("n", "<leader>gG", ":Neogit<cr>", {})
-- move between git hunks
vim.keymap.set("n", "<leader>gj", ":Gitsigns next_hunk<cr>", {})
vim.keymap.set("n", "<leader>gk", ":Gitsigns prev_hunk<cr>", {})
-- git blame
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<cr>", {})
vim.keymap.set("n", "<leader>gB", ":Git blame<cr>", {})
-- git highlight
vim.keymap.set("n", "<leader>gh", ":Gitsigns toggle_linehl<cr>", {})
-- git reset hunk
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", {})
vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<cr>", {})
-- git diff
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<cr>", {})

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
vim.keymap.set("v", "<leader>rr", '"hy:%s/<c-r>h//gc<left><left><left>', {})

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
