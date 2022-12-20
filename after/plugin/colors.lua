function SetColors(color)
    vim.opt.background = "dark"
    vim.o.cursorline = true
    vim.o.termguicolors = true
    vim.o.t_Co = 256

    color = color or "onedark"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "CursorLine", {})
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "white" })
    vim.api.nvim_set_hl(0, "Search", { fg = "white", bg = "gray" })
end

SetColors()
