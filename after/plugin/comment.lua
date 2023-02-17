require("Comment").setup({
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = "<leader>//",
    },
    opleader = {
        line = "<leader>/",
        block = "<leader>.",
    },
    extra = {
        above = "<leader>/O",
        below = "<leader>/o",
        eol = "<leader>/A",
    },
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
})
