return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = {
            { path = "~/Documents/notes/home", syntax = "markdown", ext = "md" },
            { path = "~/Documents/notes/work", syntax = "markdown", ext = "md" },
        }
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_key_mappings = {
            headers = 0
        }
    end
}
