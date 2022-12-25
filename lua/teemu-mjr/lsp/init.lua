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

local on_attach = function(client, bufnr)
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

    --
    -- setups servers --
    --
    ["sumneko_lua"] = function()
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
    end,

    ["bashls"] = function()
        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            bash = {
                filetypes = { "sh" },
            },
        })
    end,
})
