return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"munifTanjim/prettier.nvim",
	},
	config = function()
		require("prettier").setup({
			bin = "prettierd",
			filetypes = {
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"markdown",
				"scss",
				"typescript",
				"typescriptreact",
				"yaml",
			},
		})

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.code_actions.eslint,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.prismaFmt,
			},
		})
	end,
}
