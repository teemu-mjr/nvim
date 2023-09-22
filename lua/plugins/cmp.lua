return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
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
                ["<c-p>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),

                ["<c-n>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),

                ["<c-j>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),

                ["<c-k>"] = cmp.mapping(function()
                    if not cmp.visible() then
                        return
                    end

                    for key, value in pairs(cmp.get_entries()) do
                        if value:get_kind() == 15 then
                            for _ = 1, key do
                                cmp.select_next_item()
                            end
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true,
                            })
                            return
                        end
                    end
                end, { "i" }),

                ["<c-space>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.close()
                    else
                        cmp.complete()
                    end
                end, { "i", "c" }),
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            completion = { autocomplete = false },
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "cmdline" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end
}
