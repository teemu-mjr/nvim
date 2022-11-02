local nnoremap = require("teemu-mjr.remap").nnoremap

nnoremap("<leader>lf", ":Telescope find_files<cr>")
nnoremap("<leader>lg", ":Telescope live_grep<cr>")
nnoremap("<leader>lb", ":Telescope buffers<cr>")
nnoremap("<leader>lh", ":Telescope help_tags<cr>")

require("telescope").setup({
	defaults = {
		mappings = {},
	},
	pickers = {},
	extensions = {},
})
