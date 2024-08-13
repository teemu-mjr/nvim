return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = { "n", "v" },
        }
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        default_format_opts = {
            lsp_format = "fallback"
        }
    },
}
