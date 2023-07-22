return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.basics").setup({
            mappings = { windows = true },
            silent = true,
        })

        require("mini.move").setup({
            mappings = { left = "H", right = "L", down = "J", up = "K" },
        })

        require("mini.bufremove").setup({})
        require("mini.surround").setup({})
        require("mini.comment").setup({})
        require("mini.pairs").setup({})

        local starter = require("mini.starter")
        starter.setup({
            items = {
                starter.sections.recent_files(5, true),
            },
            content_hooks = {
                starter.gen_hook.adding_bullet(),
                starter.gen_hook.aligning("center", "center"),
            },
        })
    end,
}
