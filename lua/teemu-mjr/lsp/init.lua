local LspRemap = require("teemu-mjr.lsp.lsp-mappings")
local lsp_config = require("lspconfig")
require("teemu-mjr.lsp.lsp-installer")
require("teemu-mjr.lsp.null-ls")

-- Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- General on attach
local general_on_attach = function(client, bufnr)
	-- General remap
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	LspRemap.general(bufopts)

	-- Diagnostics remap
	local opts = { noremap = true, silent = true }
	LspRemap.diagnostic(opts)
	require("teemu-mjr.lsp.diagnostics").on_attach()

	-- Higlights
	if client.server_capabilities.documentHighlightProvider then
		require("teemu-mjr.lsp.higlight").on_attach(bufnr)
	end
end

-- Null-ls on attach that appends to general_on_attach
local null_ls_on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	general_on_attach(client, bufnr)
end

local lsp_flags = {
	debounce_text_changes = 150,
}

--
-- Setups servers --
--
lsp_config.sumneko_lua.setup({
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = null_ls_on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
		},
	},
})

lsp_config.clangd.setup({
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = general_on_attach,
})

lsp_config.tsserver.setup({
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = null_ls_on_attach,
})

lsp_config.html.setup({
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = null_ls_on_attach,
})

lsp_config.bashls.setup({
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = general_on_attach,
	bash = {
		filetypes = { "sh" },
	},
})

lsp_config.intelephense.setup({
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = general_on_attach,
})

lsp_config.ltex.setup({
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = general_on_attach,
})
