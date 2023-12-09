return {
    'nvimdev/lspsaga.nvim',
    opts = {
        code_action = {
            extend_gitsigns = true,
        },
        lightbulb = {
            enable = false,
        },
        symbol_in_winbar = {
            enable = false,
            hide_keyword = true,
        },
        rename = {
            keys = {
                quit = '<C-c>'
            }
        },
        ft = {
            'bash',
            'bib',
            'c',
            'cpp',
            'css',
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'lua',
            'plaintex',
            'python',
            'rust',
            'sh',
            'tex',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
            'zsh',
        }
    },
    keys = {
        { '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', noremap = true, silent = true, desc = 'Next diagnostics' },
        { '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', noremap = true, silent = true, desc = 'Prev diagnostics' },
        { 'gf', '<Cmd>Lspsaga finder<CR>', noremap = true, silent = true, desc = 'Lspsaga finder' },
        { 'gd', '<Cmd>Lspsaga goto_definition<CR>', noremap = true, silent = true, desc = 'Goto definition' },
        { mode = { 'n', 'v' }, '<Leader>ca', '<Cmd>Lspsaga code_action<CR>', noremap = true, silent = true, desc = 'Code action' },
        { 'gr', '<Cmd>Lspsaga rename<CR>', noremap = true, silent = true, desc = 'Rename' },
        { '<leader>sl', '<Cmd>Lspsaga show_line_diagnostics<CR>', noremap = true, silent = true, desc = 'Show line diagnostics' },
        { '<leader>sc', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', noremap = true, silent = true, desc = 'Show cursor diagnostics' },
        { 'K', '<Cmd>Lspsaga hover_doc<CR>', noremap = true, silent = true, desc = 'Hover' },
    },
}
