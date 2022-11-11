function SetOnedark()
	vim.opt.background = "dark"
	vim.g.onedark_hide_endofbuffer = 1
	vim.g.onedark_terminal_italics = 1
	-- vim.o.termguicolors = true

	vim.cmd([[
    syntax on
    colo onedark
    set cursorline
    hi CursorLine ctermbg=none
    hi CursorLineNr ctermfg=white
    hi Search ctermfg=white ctermbg=darkgray
    ]])
end

SetOnedark()
