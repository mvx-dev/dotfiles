-- Set leader
vim.g.mapleader = " "

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

-- Wrapping
vim.opt.shiftround = true
vim.opt.wrap = true
vim.opt.signcolumn = 'yes'

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Errors
vim.opt.visualbell = false

-- Set cursor to underline
vim.cmd [[
    set guicursor=a:hor20
]]

-- Set 80 character indicator
vim.opt.colorcolumn = "80"
