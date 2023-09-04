return {
    "catppuccin/nvim",
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            term_colors = true,
            integrations = {
                mini = true,
                which_key = true,
                overseer = true,
            },
            custom_highlights = function(colors)
                return {
                    CursorLine = { bg = colors.none },
                }
            end,
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
