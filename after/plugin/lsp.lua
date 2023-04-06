require("neodev").setup()

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities
        })
    end,
    ["lua_ls"] = function()
        require("lspconfig")["lua_ls"].setup({
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
            bash = {
                filetypes = { "sh" },
            },
        })
    end,
    ["texlab"] = function()
        require("lspconfig")["texlab"].setup({
            on_attach = function()
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

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>rD", vim.diagnostic.disable, opts)
vim.keymap.set("n", "<leader>rE", ":lua vim.diagnostic.enable()<cr>", opts)
vim.keymap.set("n", "<leader>rr", ":lua vim.diagnostic.open_float()<cr>", opts)
vim.keymap.set("n", "<leader>rk", ":lua vim.diagnostic.goto_prev()<cr>", opts)
vim.keymap.set("n", "<leader>rK",
    ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>",
    opts)
vim.keymap.set("n", "<leader>rj", ":lua vim.diagnostic.goto_next()<cr>", opts)
vim.keymap.set("n", "<leader>rJ",
    ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>",
    opts)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local bufopts = { noremap = true, silent = true, buffer = ev.buffer }

        vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", bufopts)
        vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", bufopts)
        vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<cr>", bufopts)
        vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<cr>", bufopts)
        vim.keymap.set("n", "<c-s>", ":lua vim.lsp.buf.signature_help()<cr>", bufopts)

        vim.keymap.set("n", "gw", ":lua vim.lsp.buf.document_symbol()<cr>", bufopts)
        vim.keymap.set("n", "gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", bufopts)
        vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<cr>", bufopts)
        vim.keymap.set("n", "gt", ":lua vim.lsp.buf.type_definition()<cr>", bufopts)
        vim.keymap.set("n", "<leader>af", ":lua vim.lsp.buf.code_action()<cr>", bufopts)
        vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>", bufopts)
        vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<cr>", bufopts)
    end,
})
