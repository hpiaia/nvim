return {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
        })
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox")
    end,
}
