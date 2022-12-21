function SetColors(color)
    vim.o.cursorline = true
    vim.o.termguicolors = true

    color = color or "carbonfox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "CursorLine", {})
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "white" })
    vim.api.nvim_set_hl(0, "Search", { fg = "white", bg = "gray" })
end

SetColors()
