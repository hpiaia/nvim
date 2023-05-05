return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, desc = "toggle trouble" })
		vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, desc = "workspace diagnostics" })
		vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, desc = "document diagnostics" })
		vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, desc = "loclist" })
		vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, desc = "quickfix" })
		vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, desc = "lsp references" })
	end,
}
