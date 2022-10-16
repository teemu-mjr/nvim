local LspRemap = require("teemu-mjr.lsp.lsp-remap")
local lsp_config = require("lspconfig")
require("teemu-mjr.lsp.lsp-installer")
require("teemu-mjr.lsp.null-ls")
require("teemu-mjr.lsp.diagnostics")


--Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local null_ls_servers = { "sumneko_lua", "tsserver", "jsonls", "html" }

local general_on_attach = function(client, bufnr)

  for _, v in ipairs(null_ls_servers) do
    if v == client.name then
      client.server_capabilities.documentFormattingProvider = false
    end
  end

  -- Remapping
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  LspRemap.on_attach(bufopts)

  -- Higlights
  if client.server_capabilities.documentHighlightProvider then
    require("teemu-mjr.lsp.higlight").on_attach(bufnr)
  end
end

local lsp_flags = {
  debounce_text_changes = 150,
}

--
-- Setups servers --
--
lsp_config["sumneko_lua"].setup({
  flags = lsp_flags,
  capabilities = capabilities,
  on_attach = general_on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
      },
    },
  },
})

lsp_config["tsserver"].setup({
  flags = lsp_flags,
  capabilities = capabilities,
  on_attach = general_on_attach
})

lsp_config["html"].setup({
  flags = lsp_flags,
  capabilities = capabilities,
  on_attach = general_on_attach
})
