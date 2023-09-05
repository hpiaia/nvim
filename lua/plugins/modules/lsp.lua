return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "jayp0521/mason-null-ls.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim",
        },
        config = function()
            require("mason").setup({})

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver",
                    "html",
                    "cssls",
                    "jsonls",
                    "tailwindcss",
                    "svelte",
                    "lua_ls",
                    "emmet_ls",
                    "prismals",
                    "rust_analyzer",
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- override lua_ls server setup
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end,

                    -- override tsserver server setup
                    ["tsserver"] = function()
                        require("lspconfig").tsserver.setup({
                            capabilities = capabilities,
                            init_options = {
                                preferences = {
                                    disableSuggestions = true,
                                },
                            },
                        })
                    end,

                    -- override cssls server setup
                    ["cssls"] = function()
                        require("lspconfig").cssls.setup({
                            capabilities = capabilities,
                            settings = {
                                css = {
                                    validate = false,
                                },
                            },
                        })
                    end,

                    -- override jsonls server setup
                    ["jsonls"] = function()
                        require("lspconfig").jsonls.setup({
                            capabilities = capabilities,
                            settings = {
                                json = {
                                    schemas = require("schemastore").json.schemas(),
                                },
                            },
                        })
                    end,
                },
            })

            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "prettierd",
                    "eslint-lsp",
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
                temp_dir = "/tmp",
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.formatting.rustfmt,
                    null_ls.builtins.diagnostics.eslint,
                },
                on_attach = function(current_client, bufnr)
                    if current_client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    bufnr = bufnr,
                                    filter = function(client)
                                        --  only use null-ls for formatting instead of lsp server
                                        return client.name == "null-ls"
                                    end,
                                })
                            end,
                        })
                    end
                end,
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "l3mOn4d3/luasnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<c-p>"] = cmp.mapping.select_prev_item(),
                    ["<c-n>"] = cmp.mapping.select_next_item(),
                    ["<c-space>"] = cmp.mapping.complete(),
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                formatting = {
                    format = require("lspkind").cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
            })
        end,
    },
}
