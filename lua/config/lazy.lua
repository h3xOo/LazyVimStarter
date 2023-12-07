local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
    spec = {
        { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
        { import = 'lazyvim.plugins.extras.lang.clangd' },
        { import = 'lazyvim.plugins.extras.lang.cmake' },
        { import = 'lazyvim.plugins.extras.lang.python' },
        { import = 'lazyvim.plugins.extras.lang.rust' },
        { import = 'lazyvim.plugins.extras.lang.tailwind' },
        { import = 'lazyvim.plugins.extras.lang.tex' },
        { import = 'lazyvim.plugins.extras.lang.typescript' },
        { import = 'plugins' },
        { import = 'plugins.lsp' },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = { colorscheme = { 'gruvbox' } },
    checker = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})
