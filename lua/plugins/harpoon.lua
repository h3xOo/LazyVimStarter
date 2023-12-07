return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>a', function() require('harpoon'):list():append() end, desc = 'Harpoon list' },
        { '<C-e>', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = 'Add file to harpoon' },

        { '<C-t>', function() require('harpoon'):list():select(1) end, desc = 'Change to first harpoon file' },
        { '<C-s>', function() require('harpoon'):list():select(2) end, desc = 'Change to second harpoon file' },
    }
}
