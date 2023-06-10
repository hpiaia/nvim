return {
	{ "williamboman/mason.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "gopls" },
				automatic_installation = true,
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									format = { enable = false },
									diagnostics = { globals = { "vim" } },
								},
							},
						})
					end,
					["tsserver"] = function()
						require("lspconfig").tsserver.setup({
							init_options = {
								preferences = { disableSuggestions = true },
							},
						})
					end,
				},
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				temp_dir = "/tmp",
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.diagnostics.eslint,
				},
			})
		end,
	},
}
