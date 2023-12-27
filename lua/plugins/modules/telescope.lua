return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = "  ",
                selection_strategy = "reset",
                file_ignore_patterns = { ".git/", "node_modules/", ".yarn/" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })

        telescope.load_extension("fzy_native")
        telescope.load_extension("ui-select")
    end,
}
