local LspRemap = require("teemu-mjr.lsp.lsp-mappings")
local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})
require("teemu-mjr.lsp.null-ls")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
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

local function null_attach(client)
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client)
end

-- setup servers automatically
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
    ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
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
            on_attach = on_attach,
            bash = {
                filetypes = { "sh" },
            },
        })
    end,
    ["tsserver"] = function()
        lspconfig["tsserver"].setup({
            on_attach = null_attach,
            capabilities = capabilities
        })
    end,
    ["texlab"] = function()
        lspconfig["texlab"].setup({
            on_attach = function()
                on_attach()
                vim.keymap.set("n", "<leader>z", ":TexlabForward<cr>")
            end,
            settings = {
                texlab = {
                    build = {
                        executable = "pdflatex",
                        args = {
                            "-pdf",
                            "-interaction=nonstopmode",
                            "-synctex=1",
                            "-shell-escape",
                            "%f",
                        },
                        onSave = true,
                    },
                    forwardSearch = {
                        executable = "zathura",
                        args = {
                            "--synctex-editor-command",
                            [[nvim-texlabconfig -file '%{input}' -line %{line}]],
                            "--synctex-forward",
                            "%l:1:%f",
                            "%p",
                        },
                    },
                },
            },
        })
    end,
})
