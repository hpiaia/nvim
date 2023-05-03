local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- attach lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup("attach_lsp_keymaps"),
	callback = function(e)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = e.buf, desc = "Go to definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = e.buf, desc = "Go to declaration" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = e.buf, desc = "Go to implementation" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = e.buf, desc = "Show information" })
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = e.buf, desc = "Rename" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = e.buf, desc = "Actions" })
		vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { buffer = e.buf, desc = "LSP Restart" })
	end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_on_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"help",
		"lspinfo",
		"man",
		"qf",
		"spectre_panel",
		"startuptime",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
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
