return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jayp0521/mason-null-ls.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_null_ls = require("mason-null-ls")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            mason_lspconfig.setup({
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
                    "rust_analyzer",
                },
                automatic_installation = true,
            })

            mason_null_ls.setup({
                ensure_installed = {
                    "stylua",
                    "prettierd",
                    "eslint_d",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            lspconfig["html"].setup({
                capabilities = capabilities,
            })

            lspconfig["tsserver"].setup({
                capabilities = capabilities,
                init_options = {
                    preferences = {
                        disableSuggestions = true,
                    },
                },
            })

            lspconfig["cssls"].setup({
                capabilities = capabilities,
                settings = {
                    css = {
                        validate = false,
                    },
                },
            })

            lspconfig["rust_analyzer"].setup({
                capabilities = capabilities,
            })

            lspconfig["tailwindcss"].setup({
                capabilities = capabilities,
            })

            lspconfig["svelte"].setup({
                capabilities = capabilities,
            })

            lspconfig["prismals"].setup({
                capabilities = capabilities,
            })

            lspconfig["graphql"].setup({
                capabilities = capabilities,
            })

            lspconfig["emmet_ls"].setup({
                capabilities = capabilities,
            })

            lspconfig["lua_ls"].setup({
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
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "l3mOn4d3/luasnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
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
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
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
