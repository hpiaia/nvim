return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"MunifTanjim/prettier.nvim",
	},
	config = function()
		local prettier = require("prettier")

		prettier.setup({
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

		local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		local null_ls = require("null-ls")

		null_ls.setup({
			on_attach = function(_, bufnr)
				-- add keymap
				vim.keymap.set("n", "<Leader>cf", function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end, { buffer = bufnr, desc = "code format" })

				-- format on save
				vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					group = group,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr, async = false })
					end,
				})
			end,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.code_actions.eslint,
				null_ls.builtins.formatting.prettierd,
			},
		})
	end,
}
