require("neodev").setup()

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })
    end,
    ["lua_ls"] = function()
        require("lspconfig")["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "use" }
                    }
                }
            }
        })
    end,
    ["bashls"] = function()
        require("lspconfig")["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            bash = {
                filetypes = { "sh" },
            },
        })
    end,
    ["texlab"] = function()
        require("lspconfig")["texlab"].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)
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
    ["intelephense"] = function()
        require("lspconfig")["intelephense"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                intelephense = {
                    format = {
                        braces = "k&r"
                    }
                }
            },
        })
    end,
})

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettier.with({
            extra_args = {
                "--config-precedence=prefer-file",
                "--tab-width=2",
                "--use-tabs=false",
                "--no-semi=false",
                "--single-quote=false",
                "--jsx-single-quote=false",
                "--single-attribute-per-line=true",
            },
        }),
    },
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        -- border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>rD", vim.diagnostic.disable, opts)
vim.keymap.set("n", "<leader>rE", vim.diagnostic.enable, opts)
vim.keymap.set("n", "<leader>rr", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>rk", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>rK",
    function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, opts)
vim.keymap.set("n", "<leader>rj", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>rJ",
    function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, opts)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local bufopts = { noremap = true, silent = true, buffer = ev.buffer }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, bufopts)

        vim.keymap.set("n", "gw", vim.lsp.buf.document_symbol, bufopts)
        vim.keymap.set("n", "gw", vim.lsp.buf.workspace_symbol, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader>af", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
    end,
})
