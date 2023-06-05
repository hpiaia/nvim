return {
	"edeneast/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			transparent = true,
		})
		vim.cmd("colorscheme carbonfox")
	end,
}
