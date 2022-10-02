local LspRemap = require("teemu-mjr.lsp.lsp-remap")
require("teemu-mjr.lsp.lsp-installer")
require("teemu-mjr.lsp.diagnostics")
require("teemu-mjr.lsp.null-ls")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

LspRemap.mappings(opts)

local null_ls_servers = { "sumneko_lua", "tsserver", "html" }

local on_attach = function(client, bufnr)
	for _, v in ipairs(null_ls_servers) do
		if v == client.name then
			client.resolved_capabilities.document_formatting = false
		end
	end

	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[hi! link LspReferenceText CursorColumn]])
		vim.cmd([[hi! link LspReferenceRead CursorColumn]])
		vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

		if client.server_capabilities.documentHighlightProvider then
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
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	LspRemap.on_attach(bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("lspconfig")["sumneko_lua"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
		},
	},
})

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["html"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
