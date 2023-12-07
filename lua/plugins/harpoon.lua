return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>a', function() require('harpoon'):list():append() end },
        { '<C-e>', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },

        { '<C-t>', function() require('harpoon'):list():select(1) end },
        { '<C-s>', function() require('harpoon'):list():select(2) end },
    }
}
