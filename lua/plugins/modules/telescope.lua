return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	keys = {
		{ "<leader><leader>", ":Telescope find_files<cr>", silent = true, desc = "Find Files" },
		{ "<leader>/", ":Telescope live_grep<cr>", silent = true, desc = "Live Grep" },
	},
	opts = {
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules", "package-lock.json" },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
		end,
	},
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
