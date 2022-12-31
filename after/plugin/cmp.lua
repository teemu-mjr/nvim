require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")
local luasnip = require("luasnip")

vim.opt.pumwidth = 40
vim.opt.pumheight = 10

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    preselect = cmp.PreselectMode.None,
    sources = {
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp" },
        {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
            keyword_length = 2,
        },
        { name = "luasnip" },
        { name = "path" },
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
            vim_item.kind = string.sub(vim_item.kind, 1, 3)
            vim_item.menu = ({
                luasnip = "[LUA]",
                nvim_lsp = "[LSP]",
                buffer = "[BUF]",
            })[entry.source.name]
            return vim_item
        end,
    },
    mapping = {
        ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Item }),
        ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Item }),

        ["<c-j>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),

        ["<c-f>"] = cmp.mapping.scroll_docs(-4),
        ["<c-b>"] = cmp.mapping.scroll_docs(4),

        ["<c-l>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Item })
                elseif cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Item })
                elseif luasnip.jumpable(1) then
                    luasnip.jump(1)
                end
            else
                fallback()
            end
        end, { "i", "s", "c" }),

        ["<c-h>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<c-Space>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.close()
            else
                cmp.complete()
            end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.get_selected_entry() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Item })
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Item })
            else
                fallback()
            end
        end, { "i", "s" }),
    },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path", keyword_length = 2 },
    }, {
        { name = "cmdline", keyword_length = 2 },
    }),
})