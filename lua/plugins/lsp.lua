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

            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    settings = {
                        Lua = {
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        }
                    }
                })
            end,

            ["jdtls"] = function()
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = "java",
                    callback = function()
                        require("jdtls").setup_dap()
                        require("jdtls").start_or_attach({
                            cmd = { "jdtls" }
                        })
                    end
                })
            end,

            ["omnisharp"] = function()
                require("lspconfig").omnisharp.setup({
                    enable_editorconfig_support = true,
                    enable_ms_build_load_projects_on_demand = false,
                    enable_roslyn_analyzers = true,
                    organize_imports_on_format = false,
                    enable_import_completion = false,
                    sdk_include_prereleases = true,
                    analyze_open_documents_only = false,
                    handlers = {
                        ["textDocument/definition"] = require("omnisharp_extended").handler,
                    },
                })
            end,

            ["texlab"] = function()
                require("lspconfig").texlab.setup({
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

        })

        require("null-ls").setup({
            sources = {
                require("null-ls").builtins.formatting.prettierd,
            },
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = "single",
                focusable = false
            }
        )

        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.ERROR }
            },
            signs = true,
            underline = {
                severity = { min = vim.diagnostic.severity.INFO }
            },
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

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
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
                vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format, bufopts)
            end,
        })
    end
}
