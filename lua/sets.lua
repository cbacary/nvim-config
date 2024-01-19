-- Show relative line number
vim.o.relativenumber = true

-- Neovim uses system clipboard for copy and paste
vim.opt.clipboard = "unnamedplus"

-- Show matching brackets
vim.o.showmatch = true

-- Search is only case sensitive if cases are used
vim.o.smartcase = true

-- Go to next occurrence of search term from where the cursor currently is
vim.o.incsearch = true

vim.o.updatetime = 10

-- Tab and indentation settings
vim.o.tabstop = 8
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.expandtab = true

-- Big fk boy
vim.o.undofile = true

-- Enable mouse in all modes
vim.opt.mouse = "a"

-- Modify session options
vim.opt.sessionoptions ="buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Configure backspace behavior
vim.opt.backspace = "indent,eol,start"

-- Open new splits to the right
vim.opt.splitright = true

-- Show the line and column number of the cursor position
vim.opt.ruler = true

-- coc.nvim requirements
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.wo.signcolumn = "yes"

-- Enable true color support
vim.o.termguicolors = true

-- Important for nvim-ufo (folder)
--vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
