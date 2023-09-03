return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                extensions = {
                    "neo-tree",
                    "lazy",
                    "fugitive",
                },
                options = {
                    globalstatus = true,
                    theme = "catppuccin",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
            })
        end,
    },
}
