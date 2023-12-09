return {
    'neovim/nvim-lspconfig',
    opts = {
        setup = {
            clangd = function(_, opts)
                opts.capabilities.offsetEncoding = { 'utf-16' }
                opts.on_attach = function ()
                    require("clangd_extensions.inlay_hints").setup_autocmd()
                    require("clangd_extensions.inlay_hints").set_inlay_hints()
                end
            end,
        },
    },
    init = function ()
        local keys = require('lazyvim.plugins.lsp.keymaps').get()
        keys[#keys + 1] = { 'K', false }
        keys[#keys + 1] = { 'gr', false }
    end
}
