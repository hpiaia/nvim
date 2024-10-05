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
            "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim",
        },
        config = function()
            require("mason").setup()

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(_, bufnr)
                local group = vim.api.nvim_create_augroup("format_on_save", { clear = false })

                local filter = function(client)
                    -- use those builtins for formatting instead of null-ls
                    local builtins = { "rust_analyzer" }

                    return vim.tbl_contains(builtins, client.name) or client.name == "null-ls"
                end

                vim.keymap.set("n", "<Leader>ff", function()
                    vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), filter = filter })
                end, { buffer = bufnr, desc = "format" })

                local enable_format_on_save = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = group,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr, filter = filter })
                        end,
                    })
                end

                local disable_format_on_save = function()
                    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
                end

                local toggle_format_on_save = function()
                    local exists = not vim.tbl_isempty(vim.api.nvim_get_autocmds({ group = "format_on_save" }))
                    if exists then
                        disable_format_on_save()
                        print("Format on save disabled")
                    else
                        enable_format_on_save()
                        print("Format on save enabled")
                    end
                end

                disable_format_on_save()
                enable_format_on_save()

                vim.keymap.set("n", "<Leader>fs", toggle_format_on_save, { buffer = bufnr, desc = "toggle format on save" })
            end

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
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
                            on_attach = on_attach,
                        })
                    end,

                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end,

                    ["ts_ls"] = function()
                        require("lspconfig").ts_ls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            init_options = {
                                preferences = {
                                    disableSuggestions = true,
                                },
                            },
                        })
                    end,

                    ["cssls"] = function()
                        require("lspconfig").cssls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = {
                                css = {
                                    validate = false,
                                },
                            },
                        })
                    end,

                    ["jsonls"] = function()
                        require("lspconfig").jsonls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = {
                                json = {
                                    schemas = require("schemastore").json.schemas(),
                                },
                            },
                        })
                    end,

                    ["intelephense"] = function()
                        require("lspconfig").intelephense.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            filetypes = { "php", "blade" },
                            init_options = {
                                globalStoragePath = vim.fn.stdpath("cache") .. "/intelephense/",
                                licenceKey = "00LPF1UMMOMAP5S",
                            },
                            settings = {
                                intelephense = {
                                    filetypes = { "php", "blade" },
                                    files = {
                                        associations = { "*.php", "*.blade.php" },
                                        maxSize = 5000000,
                                    },
                                },
                            },
                        })
                    end,

                    ["emmet_ls"] = function()
                        require("lspconfig").emmet_ls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            filetypes = {
                                "astro",
                                "blade",
                                "css",
                                "html",
                                "javascriptreact",
                                "svelte",
                                "typescriptreact",
                                "vue",
                            },
                        })
                    end,
                },
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "jayp0521/mason-null-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                automatic_installation = true,
                ensure_installed = {
                    "stylua",
                    "prettierd",
                },
            })

            local null_ls = require("null-ls")
            null_ls.setup({
                temp_dir = "/tmp",
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettierd,
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "l3mon4d3/luasnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            "rafamadriz/friendly-snippets",
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
                    fields = {
                        "abbr",
                        "kind",
                        "menu",
                    },
                    expandable_indicator = true,
                },
            })
        end,
    },
    {
        "folke/neodev.nvim",
        opts = {},
    },
}
