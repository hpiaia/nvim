local map = vim.keymap.set

-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape and clear hlsearch" })
map({ "i", "n" }, "<leader>h", "<cmd>noh<cr><esc>", { desc = "clear highlights" })

-- disable command history
map("n", "q:", "<nop>", { desc = "disable command history" })
map("n", "Q", "<nop>", { desc = "disable ex mode" })

-- terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "enter normal mode" })

-- tree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "file explorer" })

-- find files
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "find grep" })

-- find lsp
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "find diagnostics" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "find references" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "find document symbols" })

-- search and replace
map("v", "<leader>sr", ":s//gcI<left><left><left><left>", { desc = "search and replace" })
map("n", "<leader>sr", ":%s//gcI<left><left><left><left>", { desc = "search and replace" })
map("n", "<leader>sp", "<cmd>lua require('spectre').open_file_search()<cr>", { desc = "open spectre on file" })
map("n", "<leader>sP", "<cmd>lua require('spectre').open()<cr>", { desc = "open spectre" })

-- close buffer
map("n", "<leader>bd", "<cmd>lua require('mini.bufremove').wipeout()<cr>", { desc = "buffer delete" })

-- windows and files
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "save file" })
map("n", "<leader>q", "<cmd>w<cr><esc>", { desc = "save file" })

-- lsp
map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "show information" })
map("n", "<leader>r", "<cmd>Lspsaga rename<cr>", { desc = "rename" })
map("n", "<leader>a", "<cmd>Lspsaga code_action<cr>", { desc = "actions" })
