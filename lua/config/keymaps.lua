local map = vim.keymap.set

-- remove defaults
map("v", ">", "")
map("v", "<", "")

-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape and clear hlsearch" })

-- disable command history
map("n", "q:", "<nop>", { desc = "disable command history" })
map("n", "Q", "<nop>", { desc = "disable ex mode" })

-- terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "enter normal mode" })

-- tree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "file explorer" })

-- tab bar
map("n", "<A-,>", "<cmd>BufferPrevious<cr>", { desc = "buffer previous" })
map("n", "<A-.>", "<cmd>BufferNext<cr>", { desc = "buffer next" })
map("n", "<A-p>", "<cmd>BufferPin<cr>", { desc = "buffer pin" })
map("n", "<A-c>", "<cmd>BufferClose<cr>", { desc = "buffer close" })
map("n", "<C-p>", "<cmd>BufferPick<cr>", { desc = "buffer pick" })

-- find content
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "find grep" })

-- find lsp
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "find diagnostics" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "find references" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "find document symbols" })

-- trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "trouble toggle" })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "trouble workspace diagnostics" })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "trouble document diagnostics" })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "trouble quickfix" })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "trouble loclist" })

-- search and replace
map("v", "<leader>sr", ":s//gcI<left><left><left><left>", { desc = "search and replace" })
map("n", "<leader>sr", ":%s//gcI<left><left><left><left>", { desc = "search and replace" })
map("n", "<leader>sp", "<cmd>lua require('spectre').open_file_search()<cr>", { desc = "open spectre on file" })
map("n", "<leader>sP", "<cmd>lua require('spectre').open()<cr>", { desc = "open spectre" })

-- windows and files
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "save file" })
map("n", "<leader>q", "<cmd>q<cr><esc>", { desc = "quit" })

-- lsp
map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "show information" })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "rename" })
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "actions" })

-- dap
map("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "toggle breakpoint" })
map("n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", { desc = "toggle repl" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "continue" })
map("n", "<leader>ds", "<cmd>lua require('dap').step_over()<cr>", { desc = "step over" })
map("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", { desc = "step into" })
map("n", "<leader>do", "<cmd>lua require('dap').step_out()<cr>", { desc = "step out" })
map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", { desc = "run last" })
