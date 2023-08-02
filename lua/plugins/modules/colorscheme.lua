return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavour = "latte",
            transparent_background = true,
            term_colors = true,
            styles = {
                types = { "italic" },
            },
            integrations = {
                mason = true,
                mini = true,
                neotree = true,
                neogit = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
