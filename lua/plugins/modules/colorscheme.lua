return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "latte",
			show_end_of_buffer = true,
			integrations = {
				treesitter = true,
				telescope = true,
				which_key = true,
				mini = true,
				lsp_trouble = true,
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
