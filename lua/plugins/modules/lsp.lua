return {
    {
        "williamboman/mason.nvim",
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "svelte",
                    "lua_ls",
                    "graphql",
                    "emmet_ls",
                    "prismals",
                    "jsonls",
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    format = { enable = false },
                                    diagnostics = { globals = { "vim" } },
                                },
                            },
                        })
                    end,
                    ["tsserver"] = function()
                        require("lspconfig").tsserver.setup({
                            init_options = {
                                preferences = { disableSuggestions = true },
                            },
                        })
                    end,
                },
            })
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = { enable = false },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "l3mon4d3/luasnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<c-p>"] = cmp.mapping.select_prev_item(),
                    ["<c-n>"] = cmp.mapping.select_next_item(),
                    ["<c-space>"] = cmp.mapping.complete(),
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "luasnip" },
                },
            })
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("format_on_save", {})
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettierd.with({
                        extra_filetypes = { "svelte" },
                    }),
                    null_ls.builtins.diagnostics.eslint_d.with({
                        condition = function(utils)
                            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
                        end,
                    }),
                },
                on_attach = function(current_client, bufnr)
                    if current_client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    filter = function(client)
                                        --  only use null-ls for formatting instead of lsp server
                                        return client.name == "null-ls"
                                    end,
                                    bufnr = bufnr,
                                })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
