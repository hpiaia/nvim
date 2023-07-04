return {
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
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-space>"] = cmp.mapping.complete(),
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
            },
        })
    end,
}
