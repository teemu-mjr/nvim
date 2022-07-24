vim.g.teemu_mjr_colorscheme = "darkplus"

function ApplyColor()
    vim.cmd("colorscheme ".. vim.g.teemu_mjr_colorscheme)
end
ApplyColor()
