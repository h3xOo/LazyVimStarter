return {
    "neovim/nvim-lspconfig",
    opts = {
        setup = {
            clangd = function(_, opts)
                opts.capabilities.offsetEncoding = { "utf-16" }
            end,
        },
    },
    init = function ()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        keys[#keys + 1] = { "K", false }
        keys[#keys + 1] = { "gr", false }
    end
}
