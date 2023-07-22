return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavour = "latte",
            transparent_background = true,
            show_end_of_buffer = true,
            term_colors = true,
            styles = {
                types = { "italic" },
            },
            integrations = {
                mini = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
