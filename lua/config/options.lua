local options = {
  incsearch = true,          -- make search act like search in modern browsers
  backup = false,            -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  fileencoding = "utf-8",    -- the encoding written to a file
  hlsearch = true,           -- highlight all matches on previous search pattern
  ignorecase = true,         -- ignore case in search patterns
  mouse = "a",               -- allow the mouse to be used in neovim
  showmode = false,          -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,          -- smart case
  smartindent = true,        -- make indenting smarter again
  swapfile = false,          -- creates a swapfile
  termguicolors = true,      -- set term gui colors (most terminals support this)
  timeout = true,            -- time out on key sequences
  timeoutlen = 300,          -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,           -- enable persistent undo
  updatetime = 100,          -- faster completion (4000ms default)
  writebackup = false,       -- if a file is being edited by another program
  expandtab = true,          -- convert tabs to spaces
  shiftwidth = 2,            -- the number of spaces inserted for each indentation
  tabstop = 2,               -- insert 2 spaces for a tab
  cursorline = true,         -- highlight the current line
  number = true,             -- set numbered lines
  relativenumber = false,    -- set relative numbered lines
  breakindent = true,        -- wrap lines with indent
  wrap = false,              -- display lines as one long line
  scrolloff = 8,             -- Makes sure there are always eight lines of context
  sidescrolloff = 8,         -- Makes sure there are always eight lines of context
  signcolumn = "yes",        -- Always show the signcolumn, otherwise it would shift the text each time
  ruler = false,             -- Don't show the ruler
  title = true,              -- set the title of window to the value of the titlestring
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
