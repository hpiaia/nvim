return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader><leader>", "<cmd>Telescope find_files<cr>", silent = true, desc = "Find Files" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", silent = true, desc = "Live Grep" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
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
}
