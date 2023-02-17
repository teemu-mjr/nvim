local M = {}

M.general = function(bufopts)
    vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", bufopts)
    vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", bufopts)
    vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<cr>", bufopts)
    vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<cr>", bufopts)
    vim.keymap.set("n", "<c-s>", ":lua vim.lsp.buf.signature_help()<cr>", bufopts)

    vim.keymap.set("n", "gw", ":lua vim.lsp.buf.document_symbol()<cr>", bufopts)
    vim.keymap.set("n", "gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", bufopts)
    vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<cr>", bufopts)
    vim.keymap.set("n", "gt", ":lua vim.lsp.buf.type_definition()<cr>", bufopts)
    vim.keymap.set("n", "<leader>af", ":lua vim.lsp.buf.code_action()<cr>", bufopts)
    vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>", bufopts)
    vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<cr>", bufopts)
end

M.diagnostic = function(opts)
    vim.keymap.set("n", "<leader>rD", ":lua vim.diagnostic.disable()<cr>", opts)
    vim.keymap.set("n", "<leader>rE", ":lua vim.diagnostic.enable()<cr>", opts)
    vim.keymap.set("n", "<leader>rr", ":lua vim.diagnostic.open_float()<cr>", opts)
    vim.keymap.set("n", "<leader>rk", ":lua vim.diagnostic.goto_prev()<cr>", opts)
    vim.keymap.set("n", "<leader>rj", ":lua vim.diagnostic.goto_next()<cr>", opts)
    vim.keymap.set("n", "<leader>rl", ":lua vim.diagnostic.setloclist()<cr>", opts)
end

return M
