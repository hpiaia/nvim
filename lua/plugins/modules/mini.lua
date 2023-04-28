return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup()
		require("mini.comment").setup()
		require("mini.jump2d").setup()
		require("mini.pairs").setup()
		require("mini.starter").setup()
		require("mini.surround").setup()
	end,
}
