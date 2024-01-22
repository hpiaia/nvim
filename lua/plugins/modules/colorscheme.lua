return {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = true,
            on_colors = function() end,
            on_highlights = function() end,
        })
        vim.cmd.colorscheme("tokyonight")
    end,
}
