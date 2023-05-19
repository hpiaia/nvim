return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.prismaFmt,
				null_ls.builtins.formatting.rustywind,
				null_ls.builtins.formatting.remark,
				null_ls.builtins.code_actions.eslint,
			},
		})
	end,
}
