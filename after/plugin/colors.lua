function SetOnedark()
  vim.opt.background = "dark"

  vim.g.onedark_hide_endofbuffer = 1

  vim.o.termguicolors = true

  vim.g.onedark_terminal_italics = 1

  vim.cmd("colorscheme onedark")
end

SetOnedark()
