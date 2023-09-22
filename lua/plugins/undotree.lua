return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", {})
        vim.g.undotree_WindowLayout = 4

        vim.cmd([[
        if has("persistent_undo")
            let target_path = expand('~/.undodir')

            if !isdirectory(target_path)
                call mkdir(target_path, "p", 0700)
            endif

            let &undodir=target_path
            set undofile
        endif
        ]])
    end
}
