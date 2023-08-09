return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            extensions = { "neo-tree", "lazy", "fugitive" },
            options = { theme = "tokyonight" },
        })
    end,
}
