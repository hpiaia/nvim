return {
    { "mfussenegger/nvim-dap" },
    {
        "david-kunz/jester",
        config = function()
            require("jester").setup({
                dap = {
                    type = "node",
                    console = "externalTerminal",
                },
                path_to_jest_run = "./node_modules/.bin/jest",
                path_to_jest_debug = "./node_modules/.bin/jest",
            })
        end,
    },
}
