local LspRemap = require("teemu-mjr.lsp.lsp-mappings")
local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})
require("teemu-mjr.lsp.null-ls")

-- enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local null_ls_servers = { "tsserver", "vuels", "jsonls", "cssls" }

local on_attach = function(client, bufnr)
    -- null-ls servers
    for _, server in pairs(null_ls_servers) do
        if client.name == server then
            client.server_capabilities.documentFormattingProvider = false
            break
        end
    end

    -- hover config
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    -- signatureHelp config
    vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    -- general remap
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    LspRemap.general(bufopts)

    -- diagnostics remap
    local opts = { noremap = true, silent = true }
    LspRemap.diagnostic(opts)

    require("teemu-mjr.lsp.diagnostics").on_attach()
end

-- setup servers automatically
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
})

--
-- setups servers --
--
lspconfig["sumneko_lua"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
            },
        },
    },
})

lspconfig["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    bash = {
        filetypes = { "sh" },
    },
})
