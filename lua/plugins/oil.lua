return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            use_default_keymaps = false,
            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },
                ["<CR>"] = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["`"] = { "actions.cd", mode = "n" },
                ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["gx"] = "actions.open_external",
                ["g."] = { "actions.toggle_hidden", mode = "n" },
                ["g\\"] = { "actions.toggle_trash", mode = "n" },
                ["gf"] = function()
                    local mode = vim.fn.getqflist({ winid = 0 }).winid ~= 0 and "a" or "r"
                    require("oil.util").send_to_quickfix({ action = mode })
                end,
                ["<leader>yp"] = {
                    callback = function()
                        require("oil.actions").copy_entry_path.callback()
                        vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
                    end,
                },
            }
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
