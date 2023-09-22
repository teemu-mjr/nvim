return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function()
        require("dapui").setup()
        require("dap.ext.vscode").load_launchjs()

        vim.keymap.set("n", "<leader>dD", require("dapui").toggle, {})
        vim.keymap.set("n", "<leader>dc", require("dap").continue, {})
        vim.keymap.set("n", "<Leader>db", require("dap").toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>do", require("dap").step_over, {})
        vim.keymap.set("n", "<leader>dO", require("dap").step_out, {})
        vim.keymap.set("n", "<leader>di", require("dap").step_into, {})
    end
}
