return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "muniftanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            default_component_configs = {
                indent = {
                    with_markers = false,
                    with_expanders = true,
                },
                icon = {
                    folder_closed = "󰉋",
                    folder_open = "󰉋",
                    folder_empty = "󰉋",
                },
            },
            filesystem = {
                use_libuv_file_watcher = true,
                filtered_items = {
                    hide_dotfiles = false,
                    hide_by_name = { "node_modules" },
                    never_show = { ".DS_Store", "thumbs.db" },
                },
            },
            window = {
                width = 35,
            },
        })
    end,
}
