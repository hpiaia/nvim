return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })

        require("nvim-treesitter.configs").setup({
            enable = true,
            auto_install = true,
            sync_install = false,
            modules = {},
            ignore_install = {},
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
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<M-space>",
                },
            },
        })
    end,
}
