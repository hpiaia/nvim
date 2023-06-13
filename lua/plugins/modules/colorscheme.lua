return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			dim_nc_background = true,
			disable_background = true,
			disable_float_background = true,
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
