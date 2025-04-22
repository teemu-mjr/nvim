return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "folke/neodev.nvim",
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities();
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require("neodev").setup()
        require("mason").setup()
        require("mason-lspconfig").setup()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities
                })
            end,

            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    capabilities = capabilities,
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
                            capabilities = capabilities,
                            cmd = { "jdtls" }
                        })
                    end
                })
            end,

            ["csharp_ls"] = function()
                require("lspconfig").csharp_ls.setup({
                    capabilities = capabilities,
                    handlers = {
                        ["textDocument/definition"] = require('csharpls_extended').handler,
                        ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
                    },
                })
            end,

            ["intelephense"] = function()
                require("lspconfig").intelephense.setup({
                    capabilities = capabilities,
                    settings = {
                        intelephense = {
                            stubs = { "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl",
                                "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd",
                                "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring",
                                "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm",
                                "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell", "random",
                                "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets",
                                "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm",
                                "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache",
                                "zip", "zlib", "wordpress" }
                        }
                    }
                })
            end,

            ["texlab"] = function()
                require("lspconfig").texlab.setup({
                    capabilities = capabilities,
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

        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.ERROR }
            },
            signs = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                source = true,
                header = "",
                prefix = "",
            },
        })

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>rD", function() vim.diagnostic.enable(false) end, opts)
        vim.keymap.set("n", "<leader>rE", vim.diagnostic.enable, opts)
        vim.keymap.set("n", "<leader>rr", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>rk",
            function()
                vim.diagnostic.jump({ count = -1 })
            end, opts)
        vim.keymap.set("n", "<leader>rK",
            function()
                vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
            end, opts)
        vim.keymap.set("n", "<leader>rj",
            function()
                vim.diagnostic.jump({ count = 1 })
            end, opts)
        vim.keymap.set("n", "<leader>rJ",
            function()
                vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
            end, opts)

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local bufopts = { noremap = true, silent = true, buffer = ev.buf }

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
                vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                vim.keymap.set({ "n", "i" }, "<c-s>",
                    function()
                        vim.lsp.buf.signature_help({ border = "single", focusable = true })
                    end, bufopts)

                vim.keymap.set("n", "<leader>af", vim.lsp.buf.code_action, bufopts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            end,
        })
    end
}
