vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
            completion = {
                completionItem = {
                    snippetSupport = true,
                }
            }
        }
    },
})

vim.lsp.enable({
    "clangd",
    "csharp_ls",
    "ltex_plus",
    "lua_ls",
    "openscad_lsp",
    "prettierd",
    "pylsp",
    "texlab",
    "ts_ls",
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
