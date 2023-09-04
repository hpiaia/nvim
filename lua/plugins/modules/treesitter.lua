return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "query",
                "javascript",
                "typescript",
                "tsx",
                "svelte",
                "rust",
                "css",
                "html",
                "json",
                "jsonc",
                "yaml",
                "toml",
                "diff",
                "ini",
                "gitcommit",
                "gitignore",
                "git_config",
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
