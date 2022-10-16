local M = {}

M.on_attach = function(bufnr)
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = vim.lsp.buf.document_highlight,
  buffer = bufnr,
  group = "lsp_document_highlight",
  desc = "Document Highlight",
})
vim.api.nvim_create_autocmd("CursorMoved", {
  callback = vim.lsp.buf.clear_references,
  buffer = bufnr,
  group = "lsp_document_highlight",
  desc = "Clear All the References",
})
end

return M
