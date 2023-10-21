return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
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
    },
    config = function()
        vim.keymap.set("n", "<leader>lf", require("telescope.builtin").find_files, {})
        vim.keymap.set("n", "<leader>la", require("telescope.builtin").live_grep, {})
        vim.keymap.set("n", "<leader>lg", require("telescope.builtin").git_files, {})
        vim.keymap.set("n", "<leader>lG", require("telescope.builtin").grep_string, {})

        vim.keymap.set("n", "<leader>lb", require("telescope.builtin").buffers, {})
        vim.keymap.set("n", "<leader>lh", require("telescope.builtin").help_tags, {})
        vim.keymap.set("n", "<leader>lm", require("telescope.builtin").keymaps, {})
        vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, {})

        require("telescope").load_extension("fzf")
    end,
}
