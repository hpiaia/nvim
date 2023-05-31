local map = vim.keymap.set

-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape and clear hlsearch" })

-- disable command history
map("n", "q:", "<nop>", { desc = "disable command history" })
map("n", "Q", "<nop>", { desc = "disable ex mode" })

-- terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "enter normal mode" })

-- neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "file explorer" })

-- find files
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "find grep" })

-- lsp telescope
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "find diagnostics" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "find references" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "find document symbols" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "split window right" })

-- search and replace
map("n", "<leader>sr", ":%s//gcI<left><left><left><left>", { desc = "search and replace" })
map("v", "<leader>sr", ":s//gcI<left><left><left><left>", { desc = "search and replace" })
map("n", "<leader>sR", "<cmd>lua require('spectre').open_file_search()<cr>", { desc = "open spectre on file" })
map("n", "<leader>ss", "<cmd>lua require('spectre').open()<cr>", { desc = "open spectre" })

-- close buffer
map("n", "<leader>bd", "<cmd>bd<cr><esc>", { desc = "buffer delete" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "save file" })
