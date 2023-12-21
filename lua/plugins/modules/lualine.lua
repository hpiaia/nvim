return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            extensions = {
                "neo-tree",
                "lazy",
                "fugitive",
            },
            options = {
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                theme = "tokyonight",
            },
        },
    },
}
