vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({
				with_sync = true,
			})
		end,
	})
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		}),
		require("mason-lspconfig").setup({
			ensure_installed = { "sumneko_lua", "tsserver", "pyright", "rust_analyzer" },
		}),
	})
	use("simrat39/rust-tools.nvim")
	use("mfussenegger/nvim-jdtls")
	use("sbdchd/neoformat")
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
	use("hrsh7th/nvim-cmp") --> Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("nvim-lua/lsp_extensions.nvim")
	use("glepnir/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Editor
	use("windwp/nvim-ts-autotag")
	require("nvim-ts-autotag").setup()
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Commenting
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	})
end)
