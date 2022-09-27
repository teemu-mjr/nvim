local Remap = require("teemu-mjr.keymap")

local nnoremap = Remap.nnoremap

local M = {}

M.mappings = function(opts)
  nnoremap("<leader>dd", ":lua vim.diagnostic.open_float()<cr>", opts)
  nnoremap("<leader>dk", ":lua vim.diagnostic.goto_prev()<cr>", opts)
  nnoremap("<leader>dj", ":lua vim.diagnostic.goto_next()<cr>", opts)
  nnoremap("<leader>dl", ":lua vim.diagnostic.setloclist()<cr>", opts)
end


M.on_attach = function(bufopts)
  nnoremap("gD", ":lua vim.lsp.buf.declaration()<cr>", bufopts)
  nnoremap("gd", ":lua vim.lsp.buf.definition()<cr>", bufopts)
  nnoremap("K", ":lua vim.lsp.buf.hover()<cr>", bufopts)
  nnoremap("gi", ":lua vim.lsp.buf.implementation()<cr>", bufopts)
  nnoremap("<c-k>", ":lua vim.lsp.buf.signature_help()<cr>", bufopts)

  nnoremap("gw", ":lua vim.lsp.buf.document_symbol()<cr>", bufopts)
  nnoremap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", bufopts)
  nnoremap("gr", ":lua vim.lsp.buf.references()<cr>", bufopts)
  nnoremap("gt", ":lua vim.lsp.buf.type_definition()<cr>", bufopts)
  nnoremap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>", bufopts)
  nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>", bufopts)
  nnoremap("<leader>f", ":lua vim.lsp.buf.formatting()<cr>", bufopts)
end

return M
