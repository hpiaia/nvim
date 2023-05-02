return {
	"echasnovski/mini.bufremove",
	keys = {
		{
			"<leader>c",
			function()
				require("mini.bufremove").delete(0, false)
			end,
			desc = "Close Buffer",
		},
	},
}
