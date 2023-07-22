return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-fzy-native.nvim",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = "  ",
                selection_strategy = "reset",
            },
        })
        require("telescope").load_extension("fzy_native")
    end,
}
