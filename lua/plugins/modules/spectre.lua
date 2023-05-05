return {
	"nvim-pack/nvim-spectre",
	config = function()
		local spectre = require("spectre")

		vim.keymap.set("n", "<leader>S", function()
			spectre.open_visual()
		end, {
			desc = "open spectre",
		})

		vim.keymap.set("n", "<leader>sw", function()
			spectre.open_visual({ select_word = true })
		end, {
			desc = "search current word",
		})

		vim.keymap.set("n", "<leader>sp", function()
			spectre.open_file_search({ select_word = true })
		end, {
			desc = "search on current file",
		})
	end,
}
