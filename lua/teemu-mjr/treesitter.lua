require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = "all",

	-- List of parsers to ignore installing (for "all")
	ignore_install = {},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = false,

	indent = {
		enable = true,
	},

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- list of language that will be disabled
		disable = {},

		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

-- Automatic folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
