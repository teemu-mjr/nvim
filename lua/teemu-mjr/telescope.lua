local nnoremap = require("teemu-mjr.remap").nnoremap

local builtin = require("telescope.builtin")
nnoremap("<leader>lf", builtin.find_files)
nnoremap("<leader>lg", builtin.git_files)
nnoremap("<leader>la", builtin.live_grep)
nnoremap("<leader>ls", function()
    builtin.grep_string({ search = vim.fn.input("Search: ") })
end)
nnoremap("<leader>lb", builtin.buffers)
nnoremap("<leader>lh", builtin.help_tags)

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "select_horizontal",
            },
        },
    },
    pickers = {},
    extensions = {},
})
