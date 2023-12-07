-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require('config.discipline')

discipline.cowboy()

local keymap = vim.keymap

local opts = { silent = true, noremap = true }

keymap.set('n', 'x', '"_x', opts)

keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

keymap.set('n', 'f', 'f')
keymap.set('n', 'F', 'F')

keymap.set('v', 'f', 'f')
keymap.set('v', 'F', 'F')

keymap.set('n', 'tc', '<Cmd>tabclose<CR>', opts)
keymap.set('n', 'te', '<Cmd>tabedit<CR>', opts)
keymap.set('n', 'tn', '<Cmd>tabnext<CR>', opts)
keymap.set('n', 'tp', '<Cmd>tabprevious<CR>', opts)

keymap.set('n', '<leader>ws', '<Cmd>split<CR><C-w>w', opts)
keymap.set('n', '<leader>wv', '<Cmd>vsplit<CR><C-w>w', opts)

keymap.set('n', '<leader>wc', '<Cmd>close<CR>', opts)
keymap.set('n', '<leader>we', '<C-w>=')
keymap.set('n', '<leader>ww', '<C-w>w')
keymap.set('n', '<leader>wh', '<C-w>h')
keymap.set('n', '<leader>wk', '<C-w>k')
keymap.set('n', '<leader>wj', '<C-w>j')
keymap.set('n', '<leader>wl', '<C-w>l')

keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', opts)
keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', opts)

keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('x', '<leader>p', [["_dP]])

keymap.set({'n', 'v'}, '<leader>y', [["+y]])
keymap.set('n', '<leader>Y', [["+Y]])

keymap.set({'n', 'v'}, '<leader>d', [["_d]])

keymap.set('i', '<C-c>', '<Esc>')

keymap.set('n', 'Q', '<nop>')

keymap.set('n', '<leader><C-k>', '<cmd>cnext<CR>zz', opts)
keymap.set('n', '<leader><C-j>', '<cmd>cprev<CR>zz', opts)
keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', opts)
keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', opts)

keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

keymap.del({'n', 't'}, '<C-h>')
keymap.del({'n', 't'}, '<C-l>')

keymap.del('n', ']d')
keymap.del('n', '[d')
keymap.del('n', ']e')
keymap.del('n', '[e')
keymap.del('n', ']w')
keymap.del('n', '[w')
