local nnoremap = require("teemu-mjr.remap").nnoremap
local vnoremap = require("teemu-mjr.remap").vnoremap

local M = {}

M.general = function(bufopts)
    nnoremap("gD", ":lua vim.lsp.buf.declaration()<cr>", bufopts)
    nnoremap("gd", ":lua vim.lsp.buf.definition()<cr>", bufopts)
    nnoremap("K", ":lua vim.lsp.buf.hover()<cr>", bufopts)
    nnoremap("gi", ":lua vim.lsp.buf.implementation()<cr>", bufopts)
    nnoremap("<c-s>", ":lua vim.lsp.buf.signature_help()<cr>", bufopts)

    nnoremap("gw", ":lua vim.lsp.buf.document_symbol()<cr>", bufopts)
    nnoremap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", bufopts)
    nnoremap("gr", ":lua vim.lsp.buf.references()<cr>", bufopts)
    nnoremap("gt", ":lua vim.lsp.buf.type_definition()<cr>", bufopts)
    nnoremap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>", bufopts)
    nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>", bufopts)
    nnoremap("<leader>f", ":lua vim.lsp.buf.format()<cr>", bufopts)
end

M.diagnostic = function(opts)
    nnoremap("<leader>rD", ":lua vim.diagnostic.disable()<cr>", opts)
    nnoremap("<leader>rE", ":lua vim.diagnostic.enable()<cr>", opts)
    nnoremap("<leader>rr", ":lua vim.diagnostic.open_float()<cr>", opts)
    nnoremap("<leader>rk", ":lua vim.diagnostic.goto_prev()<cr>", opts)
    nnoremap("<leader>rj", ":lua vim.diagnostic.goto_next()<cr>", opts)
    nnoremap("<leader>rl", ":lua vim.diagnostic.setloclist()<cr>", opts)
end

return M
