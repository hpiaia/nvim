local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- attach lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup("attach_lsp_keymaps"),
	callback = function(e)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = e.buf, desc = "go to definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = e.buf, desc = "go to declaration" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = e.buf, desc = "go to implementation" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = e.buf, desc = "show information" })
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = e.buf, desc = "rename" })
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = e.buf, desc = "format" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = e.buf, desc = "actions" })
		vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { buffer = e.buf, desc = "lsp restart" })
	end,
})

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
		vim.lsp.buf.format({ buffer = event.buf })
	end,
})
