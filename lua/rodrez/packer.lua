vim.cmd([[packadd packer.nvim]])
-- # Recognize Astro files
vim.filetype.add({
  extension = {
    astro = "astro"
  }
})

return require("packer").startup(function(use)
	-- Packer can "manage" itself
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({
				with_sync = true,
			})
		end,
	},{run = ":TSUpdate"})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({'williamboman/mason.nvim',
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		}),
})
	use({'williamboman/mason-lspconfig.nvim',
		require("mason-lspconfig").setup({
			ensure_installed = { "sumneko_lua", "tsserver", "pyright", "rust_analyzer", "astro", "svelte" },
		}),
})
	use("neovim/nvim-lspconfig")
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

	-- Practice
	use("ThePrimeagen/vim-be-good")

	-- Editor
	-- test
	use({
		"kylechui/nvim-surround",
		tag = "v1.0.0", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
			require("nvim-surround").setup({})
		end,
	})
	use({
		"windwp/nvim-autopairs",
    config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").toggle({
				window = {
					backdrop = 0,
				},
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- Startup
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup()
		end,
	})

	-- Git integrations
	use("lewis6991/gitsigns.nvim")

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
