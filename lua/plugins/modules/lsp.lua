return {
	{ "williamboman/mason.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "rust_analyzer" },
			})

			require("mason-lspconfig").setup_handlers({
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
			})
		end,
	},
}
