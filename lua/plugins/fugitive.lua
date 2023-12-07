return {
    'tpope/vim-fugitive',
    lazy = true,
    config = function ()
        local h3xo_fugitive = vim.api.nvim_create_augroup('h3xo_fugitive', {})
        local autocmd = vim.api.nvim_create_autocmd
        autocmd('BufWinEnter', {
            group = h3xo_fugitive,
            pattern = '*',
            callback = function()
                if vim.bo.ft ~= 'fugitive' then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set('n', '<leader>p', function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set('n', '<leader>P', function()
                    vim.cmd.Git({'pull',  '--rebase'})
                end, opts)
                vim.keymap.set('n', '<leader>t', '<Cmd>Git push -u origin ', opts);
            end,
        })
    end,
    keys = {
        { '<leader>gs', vim.cmd.Git, desc = 'Open Fugitive'}
    },
}
