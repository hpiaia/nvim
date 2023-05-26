return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-go",
		"rouge8/neotest-rust",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
				require("neotest-rust"),
			},
		})
	end,
}
