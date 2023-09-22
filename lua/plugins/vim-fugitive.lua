return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gB", "<cmd>Git blame<cr>", {})
    end
}
