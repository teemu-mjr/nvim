local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		formatting.prettierd.with({
			extra_args = {
				"--config-precedence=prefer-file",
				"--tab-width=2",
				"--use-tabs=false",
				"--no-semi=false",
				"--single-quote=false",
				"--jsx-single-quote=false",
				"--single-attribute-per-line=true",
			},
		}),
	},
})
