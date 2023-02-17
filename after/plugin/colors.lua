require("onedark").setup({
    style = "warm", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    ending_tildes = true,
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },
})

function SetColor(color)
    vim.o.cursorline = true
    vim.o.termguicolors = true

    color = color or "onedark"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "CursorLine", {})
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "white" })
    vim.api.nvim_set_hl(0, "Search", { fg = "white", bg = "gray" })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = "white", bg = "none", bold = true })

    vim.api.nvim_set_hl(0, "netrwMarkFile", { fg = "white", bg = "gray" })
end

SetColor()
