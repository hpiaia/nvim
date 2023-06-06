return {
	"edeneast/nightfox.nvim",
	config = function()
		require("nightfox").setup({})
		vim.cmd("colorscheme carbonfox")
	end,
}
