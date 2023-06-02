return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			temp_dir = "/tmp",
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.phpcsfixer,
			},
		})
	end,
}
