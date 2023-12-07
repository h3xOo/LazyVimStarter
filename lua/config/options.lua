local set = vim.opt

vim.scriptencoding = 'utf-8'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

vim.g.autoformat = false

set.conceallevel = 0

set.number = true
set.relativenumber = false
set.pumblend = 0

set.linebreak = true
set.signcolumn = 'number'
set.cursorline = true
set.title = true

set.expandtab = true
set.smarttab = true
set.smartindent = true
set.autoindent = true

local tabsize = 4
set.tabstop = tabsize
set.shiftwidth = tabsize
set.softtabstop = tabsize

set.mouse = 'a'
set.clipboard:append({ 'unnamedplus' })

set.guicursor = ''
set.termguicolors = true

set.path:append({ '**' })
set.wildmenu = true
set.hidden = true
set.wildmode = { 'longest', 'list', 'full' }

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.shell = 'zsh'
set.background = 'dark'

set.backupskip = { '/tmp/*' }

set.backspace = { 'start', 'eol', 'indent' }
set.showmode = false

set.wildignore:append({ '*/node_modules/*' })

set.iskeyword:append({ '-', '.', '>' })

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

set.formatoptions:append({ 'r' })
