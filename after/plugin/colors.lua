vim.g.gruvbox_contrast_dark = 'hard'
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.gruvbox_invert_selection = '0'
vim.opt.background = "dark"

vim.cmd("colorscheme tokyonight")

local hl = function(variable, opts)
  vim.api.nvim_set_hl(0, variable, opts)
end

hl("ColorColumn", {
  ctermbg = 0,
  bg = "#555555",
})

hl("CursorLineNR", {
  bg = "None"
})

hl("LineNr", {
  fg = "#5eacd3"
})

hl("netrwDir", {
  fg = "#5eacd3"
})
