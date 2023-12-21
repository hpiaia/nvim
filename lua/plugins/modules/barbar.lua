return {
    "romgrk/barbar.nvim",
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        insert_at_start = true,
        sidebar_filetypes = {
            ["neo-tree"] = { event = "BufWipeout" },
        },
    },
}
