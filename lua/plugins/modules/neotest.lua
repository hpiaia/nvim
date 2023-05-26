return {
	"nvim-neotest/neotest",
	dependencies = {
		"rouge8/neotest-rust",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rust"),
			},
		})
	end,
}
