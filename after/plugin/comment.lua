require("Comment").setup({
    padding = true,
    sticky = true,
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
})
