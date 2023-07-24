return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
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
                components = {
                    name = function(_, node)
                        return {
                            text = " " .. node.name,
                            highlight = "NeoTreeFileName",
                        }
                    end,
                },
            },
            window = {
                width = 35,
            },
        })
    end,
}
