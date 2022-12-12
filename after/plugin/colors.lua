function SetOnedark()
	vim.opt.background = "dark"
	vim.g.onedark_hide_endofbuffer = 0
	vim.g.onedark_terminal_italics = 1
	vim.o.termguicolors = true

    vim.cmd([[
    augroup colorset
    autocmd!
    let s:white = { "gui": "#FFFFFF", "cterm": "145", "cterm16" : "7" }
    let s:gray = { "gui": "#656565", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("CursorLine", {})
    autocmd ColorScheme * call onedark#set_highlight("CursorLineNr", { "fg": s:white })
    autocmd ColorScheme * call onedark#set_highlight("Search", { "bg": s:gray, "fg": s:white })
    augroup END

    colo onedark
    set cursorline
    ]])
end

SetOnedark()
