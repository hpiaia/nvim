return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				treesitter = true,
				telescope = true,
				which_key = true,
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
