vim.keymap.set("n", "<leader>lf", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>lg", require("telescope.builtin").git_files, {})
vim.keymap.set("n", "<leader>la", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>lb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>lh", require("telescope.builtin").help_tags, {})
vim.keymap.set("n", "<leader>lm", require("telescope.builtin").keymaps, {})
vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, {})

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            ".git/",
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    extensions = {},
})
