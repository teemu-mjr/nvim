M = {}

M.on_attach = function()
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
        float = {
            -- border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })
end

return M
