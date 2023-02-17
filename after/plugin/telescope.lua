local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>lf", builtin.find_files)
vim.keymap.set("n", "<leader>lg", builtin.git_files)
vim.keymap.set("n", "<leader>la", builtin.live_grep)
vim.keymap.set("n", "<leader>ls", function()
    builtin.grep_string({ search = vim.fn.input("Search: ") })
end, {})
vim.keymap.set("n", "<leader>lb", builtin.buffers, {})
vim.keymap.set("n", "<leader>lh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>lm", builtin.keymaps, {})

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<c-h>"] = "select_horizontal",
            },
        },
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
