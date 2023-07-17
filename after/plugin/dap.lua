require("dapui").setup()
require("dap.ext.vscode").load_launchjs()

vim.keymap.set("n", "<leader>dD", require("dapui").toggle, {})
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end)
vim.keymap.set("n", "<Leader>db", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end)
vim.keymap.set("n", "<leader>dO", function() require("dap").step_out() end)
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end)