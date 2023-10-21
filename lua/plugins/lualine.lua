return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            always_divide_middle = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = {},
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 4 } },
            lualine_x = { "encoding", "fileformat" },
            lualine_y = { "progress", "location" },
            lualine_z = {},
        },
    }
}
