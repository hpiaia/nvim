return {
	"nvim-neotest/neotest",
	dependencies = {
		"rouge8/neotest-rust",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rust")({}),
				require("neotest-go")({}),
				require("neotest-jest")({}),
				require("neotest-vitest")({}),
			},
		})
	end,
}
