return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"muniftanjim/nui.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>e", ":Neotree toggle<cr>", silent = true, desc = "File Explorer" },
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				indent = {
					with_markers = false,
					with_expanders = true,
				},
			},
			window = {
				width = 35,
			},
			filesystem = {
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_by_name = { "node_modules" },
					never_show = { ".DS_Store", "thumbs.db" },
				},
			},
		})
	end,
}
