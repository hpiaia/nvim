return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            term_colors = true,
            styles = {
                types = { "italic" },
            },
            integrations = {
                mason = true,
                mini = true,
                neotree = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
