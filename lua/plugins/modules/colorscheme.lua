return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            transparent_background = false,
            show_end_of_buffer = true,
            term_colors = true,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
