return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            keys = function ()
                return {}
            end
        },
        'FelipeLema/cmp-async-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'petertriho/cmp-git',
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = function()
        local cmp = require('cmp')
        local defaults = require('cmp.config.default')()
        return {
            completion = {
                completeopt = 'menu,preview,noinsert',
            },
            performance = {
                max_view_entries = 30,
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<S-CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ['<C-CR>'] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lua' },
                { name = 'path' },
            }, {
                { name = 'buffer' },
            }),
            formatting = {
                format = function(_, item)
                    local icons = require('lazyvim.config').icons.kinds
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end
                    return item
                end,
            },
            sorting = defaults.sorting,
        }
    end,
    config = function (_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
        end
        local cmp = require('cmp')
        cmp.setup(opts)

        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })

        require('cmp_git').setup()
    end,
}
