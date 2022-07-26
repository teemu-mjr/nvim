local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		formatting.prettier.with({
			extra_args = {
				"--semi",
				"--double-quote",
				"--jsx-double-quite",
				"--tab-width=2",
			},
		}),
		formatting.stylua,
	},
})
