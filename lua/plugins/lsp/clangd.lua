return {
    "p00f/clangd_extensions.nvim",
    opts = {
        inlay_hints = {
            inline = vim.fn.has('nvim-0.10') == 1,
        },
    },
    keys = {
        { 'gch', '<Cmd>ClangdSwitchSourceHeader<CR>', silent = true, noremap = true, desc = 'Clangd switch source header' }
    },
}
