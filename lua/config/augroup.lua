local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- auto create parent directories when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("format_on_save"),
    callback = function(event)
        vim.lsp.buf.format({
            buffer = event.buf,
            filter = function(client)
                local ignore = { "tsserver" }
                return not vim.tbl_contains(ignore, client.name)
            end,
        })
    end,
})
