return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		lazy = true,
		config = false,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- Pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "saghen/blink.cmp" },
		},
		opts = {
			autoformat = true,
		},
		config = function()
			-- Add blink.cmp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("blink.cmp").get_lsp_capabilities()
			)

			local lsp_zero = require("lsp-zero")

			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(_, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
			})

			-- The Gleam language server is not packaged in Mason
			require("lspconfig").gleam.setup({
				cmd = { "/Users/dmo/dev/cs480_ossd/gleam/target/debug/gleam", "lsp" },
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"biome",
					"lua_ls",
					"pyright",
					"ruff",
					"typos_lsp",
				},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										-- get the LSP to recognize the `vim` global
										globals = { "vim" },
									},
								},
							},
						})
					end,

					typos_lsp = function()
						require("lspconfig").typos_lsp.setup({
							init_options = {
								diagnosticSeverity = "Hint",
							},
						})
					end,

					-- use Ruff for linting, formatting, and organizing imports
					pyright = function()
						require("lspconfig").pyright.setup({
							settings = {
								pyright = {
									-- using Ruff's import organizer
									disableOrganizeImports = true,
								},
								python = {
									analysis = {
										-- ignore all files for analysis to exclusively use Ruff for linting
										ignore = { "*" },
									},
								},
							},
						})
					end,

					rust_analyzer = function()
						require("lspconfig").rust_analyzer.setup({
							settings = {
								["rust-analyzer"] = {
									checkOnSave = {
										command = "clippy",
									},
								},
							},
						})
					end,
				},
			})
		end,
	},

	{

		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			},

			format_after_save = {
				lsp_format = "fallback",
				async = true,
			},
		},
	},
}
