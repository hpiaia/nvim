return {
  { "williamboman/mason.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        end,
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
        },
      })

      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,

        ["lua_ls"] = function(server_name)
          require("lspconfig")[server_name].setup({
            settings = {
              Lua = { diagnostics = { globals = { "vim" } } }
            }
          })
        end,

        ["tsserver"] = function(server_name)
          require("lspconfig")[server_name].setup({
            init_options = {
              preferences = {
                disableSuggestions = true,
              },
            },
          })
        end
      }
    end,
  },
}
