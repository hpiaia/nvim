return {
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    },
    {
        "NeogitOrg/neogit",
        config = function()
            require("neogit").setup({})
        end,
    },
}
