return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            auto_install = true,
        })
    end,
}
