return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module "obsidian"
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in 4.0.0
        ui = {
            enable = false
        },
        workspaces = {
            {
                name = "personal",
                path = "~/Documents/vault",
            },
        },
        picker = {
            name = "telescope.nvim",
        },
        daily_notes = {
            enabled = true,
            folder = "journal",
            date_format = "YYYY-MM-DD",
            default_tags = { "journal", "daily" },
        },
        checkbox = {
            enabled = true,
            create_new = true,
            order = { " ", "x" },
        },
        callbacks = {
            post_setup = function()
                vim.keymap.set("n", "<leader>od", "<cmd>Obsidian dailies<cr>", { buffer = false })
                vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", { buffer = false })
                vim.keymap.set("n", "<leader>ln", "<cmd>Obsidian search<cr>", { buffer = false })
            end,
            enter_note = function(note)
                vim.keymap.set("n", "<c-space>", "<cmd>Obsidian toggle_checkbox<cr>", { buffer = true })
                vim.keymap.set("n", "<leader>ol", "<cmd>Obsidian links<cr>", { buffer = true })
                vim.keymap.set("n", "<leader>or", "<cmd>Obsidian rename<cr>", { buffer = true })
                vim.keymap.set("n", "<leader>oi", "<cmd>Obsidian paste_img<cr>", { buffer = true })

                vim.keymap.set("n", "<s-tab>", function()
                    require("obsidian.actions").nav_link "prev"
                end, { buffer = true })

                vim.keymap.set("n", "<tab>", function()
                    require("obsidian.actions").nav_link "next"
                end, { buffer = true })

                vim.keymap.set("n", "<leader>op", function()
                    require("obsidian.actions").start_presentation(note.bufnr)
                end, { buffer = true })
            end,
        },
    },
}
