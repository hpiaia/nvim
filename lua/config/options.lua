local opt = vim.opt

opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.shiftwidth = 2 -- size of an indent
opt.tabstop = 2 -- number of spaces tabs count for

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.o.guifont = "SFMono Nerd Font:h12"
