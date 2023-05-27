return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.basics").setup({
			mappings = { windows = true },
			silent = true,
		})
		require("mini.move").setup({
			mappings = { left = "H", right = "L", down = "J", up = "K" },
		})
		require("mini.starter").setup({})
		require("mini.surround").setup({})
		require("mini.comment").setup({})
		require("mini.pairs").setup({})
		require("mini.cursorword").setup({})
	end,
}
