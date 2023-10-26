return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = {
            { path = "~/Documents/notes/home", syntax = "markdown", ext = "md" },
            { path = "~/Documents/notes/work", syntax = "markdown", ext = "md" },
        }
    end
}
