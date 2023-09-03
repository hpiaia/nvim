return {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            show_end_of_buffer = true,
        })

        vim.cmd.colorscheme("catppuccin")

        -- enable transparency
        vim.cmd("hi CursorLine ctermbg=none guibg=none")
        vim.cmd("hi Normal ctermbg=none guibg=none")
        vim.cmd("hi SignColumn ctermbg=none guibg=none")
        vim.cmd("hi NormalNC ctermbg=none guibg=none")
        vim.cmd("hi MsgArea ctermbg=none guibg=none")
        vim.cmd("hi TelescopeBorder ctermbg=none guibg=none")
        vim.cmd("let &fcs='eob: '")
    end,
}
