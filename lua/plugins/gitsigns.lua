return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({})
        vim.keymap.set("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", {})
        vim.keymap.set("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", {})
        vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", {})
        vim.keymap.set("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", {})
        vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns blame_line<cr>", {})
    end
}
