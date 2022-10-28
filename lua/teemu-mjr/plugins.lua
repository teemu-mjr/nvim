return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Completion
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("onsails/lspkind.nvim")
	use("tzachar/cmp-tabnine")

	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	--
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"s1n7ax/nvim-window-picker",
		tag = "v1.*",
		config = function()
			require("window-picker").setup()
		end,
	})
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("akinsho/toggleterm.nvim")
	use("folke/which-key.nvim")
	use("nvim-lualine/lualine.nvim")
	use("numToStr/Comment.nvim")
	use("tpope/vim-surround")
	use("qpkorr/vim-bufkill")

	-- Visual
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")
	use("lewis6991/gitsigns.nvim")
	use("akinsho/bufferline.nvim")
	-- Theme
	-- use("gruvbox-community/gruvbox")
	-- use("folke/tokyonight.nvim")
	use("joshdick/onedark.vim")
end)
