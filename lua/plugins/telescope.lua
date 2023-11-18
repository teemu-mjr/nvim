return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>lf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>la", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>lg", builtin.git_files, {})
        vim.keymap.set("n", "<leader>lG", builtin.grep_string, {})

        vim.keymap.set("n", "<leader>lb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>lh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>lm", builtin.keymaps, {})
        vim.keymap.set("n", "<leader>ld", builtin.diagnostics, {})
    end,
}
