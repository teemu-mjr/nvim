local Remap = require("teemu-mjr.keymap")

local nnoremap = Remap.nnoremap

local opts = { noremap=true, silent=true }

nnoremap("<leader>dd", ":lua vim.diagnostic.open_float()<cr>", opts)
nnoremap("<leader>dk", ":lua vim.diagnostic.goto_prev()<cr>", opts)
nnoremap("<leader>dj", ":lua vim.diagnostic.goto_next()<cr>", opts)
nnoremap("<leader>dl", ":lua vim.diagnostic.setloclist()<cr>", opts)

nnoremap("gD", ":lua vim.lsp.buf.declaration()<cr>")
nnoremap("gd", ":lua vim.lsp.buf.definition()<cr>")
nnoremap("K", ":lua vim.lsp.buf.hover()<cr>")
nnoremap("gi", ":lua vim.lsp.buf.implementation()<cr>")
nnoremap("<c-k>", ":lua vim.lsp.buf.signature_help()<cr>")

nnoremap("gw", ":lua vim.lsp.buf.document_symbol()<cr>")
nnoremap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>")
nnoremap("gr", ":lua vim.lsp.buf.references()<cr>")
nnoremap("gt", ":lua vim.lsp.buf.type_definition()<cr>")
nnoremap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>")
nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>")
nnoremap("<leader>f", ":lua vim.lsp.buf.formatting()<cr>")
