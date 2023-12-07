return {
    {
        'ntpeters/vim-better-whitespace',
        config = function ()
            vim.g.better_whitespace_enabled = 1
            vim.g.strip_whitespace_on_save = 1
            vim.g.current_line_whitespace_disabled_soft = 1
        end,
    },
    {
        "lervag/vimtex",
        lazy = true,
        ft = 'tex',
        config = function()
            vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
            vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_imaps_enabled = 0
            vim.g.tex_comment_nospell = 1
        end,
    },
    'ggandor/lightspeed.nvim',
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
        },
        opts = {
            options = {
                mode = "tabs",
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },
}
