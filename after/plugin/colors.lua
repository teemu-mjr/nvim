vim.g.teemu_mjr_colorscheme = "gruvbox"

function ApplyColor()
    vim.cmd("colorscheme ".. vim.g.teemu_mjr_colorscheme)
end
ApplyColor()
