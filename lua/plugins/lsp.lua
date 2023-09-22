return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup()
        require("mason").setup()
        require("mason-lspconfig").setup()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,

            ["jdtls"] = function()
                require("jdtls").setup_dap({ hotcodereplace = "auto" })
            end,

            ["texlab"] = function()
                require("lspconfig").texlab.setup({
                    on_attach = function(client, bufnr)
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

        require("null-ls").setup({
            sources = {
                require("null-ls").builtins.formatting.prettierd,
            },
        })

        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.ERROR }
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
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
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                vim.keymap.set({ "n", "i" }, "<c-s>", vim.lsp.buf.signature_help, bufopts)

                vim.keymap.set("n", "<leader>af", vim.lsp.buf.code_action, bufopts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
                vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
            end,
        })
    end
}
