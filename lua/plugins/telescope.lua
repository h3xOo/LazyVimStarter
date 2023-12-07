local is_inside_work_tree = {}

local function live_grep_from_project_git_root()
    local function is_git_repo()
        vim.fn.system('git rev-parse --is-inside-work-tree')
        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir('.git', '.;')
        return vim.fn.fnamemodify(dot_git_path, ':h')
    end

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        is_inside_work_tree[cwd] = is_git_repo()
    end

    local opts = {}
    if is_inside_work_tree[cwd] then
        opts = {
            cwd = get_git_root(),
            hidden = false,
        }
    end

    require('telescope.builtin').live_grep(opts)
end

local function find_files_from_project_git_root()
    local function is_git_repo()
        vim.fn.system('git rev-parse --is-inside-work-tree')
        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir('.git', '.;')
        return vim.fn.fnamemodify(dot_git_path, ':h')
    end

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        is_inside_work_tree[cwd] = is_git_repo()
    end

    local opts = {}
    if is_inside_work_tree[cwd] then
        opts = {
            cwd = get_git_root(),
            hidden = false,
        }
    end

    require('telescope.builtin').find_files(opts)
end

return {
    "telescope.nvim",
    dependencies = {
        {
        "nvim-telescope/telescope-fzy-native.nvim",
            build = "make -C deps/fzy-lua-native",
        },
        {
            'nvim-telescope/telescope-file-browser.nvim'
        },
    },

    keys = {
        { '<leader>gs', false },
        { ';t', function ()
            require('telescope.builtin').help_tags()
        end },
        { ';;', function ()
            require('telescope.builtin').resume()
        end },
        { ';e', function ()
            require('telescope.builtin').diagnostics()
        end },
        { ';gs', function ()
            require('telescope.builtin').git_status()
        end },
        { ';gc', function ()
            require('telescope.builtin').git_commits()
        end },
        { ';gb', function ()
            require('telescope.builtin').git_branches()
        end },
        { '\\\\', function ()
            require('telescope.builtin').buffers()
        end },
        { ';f', find_files_from_project_git_root },
        { ';r', live_grep_from_project_git_root },
        { '<leader>sf', function ()
            local telescope = require('telescope')

            local function telescope_buffer_dir()
                return vim.fn.expand('%:p:h')
            end

            telescope.extensions.file_browser.file_browser({
                path = '%:p:h',
                cwd = telescope_buffer_dir(),
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                previewer = false,
                initial_mode = 'normal',
                layout_config = {
                    height = 40,
                },
            })
        end,
        desc = 'Open File Browser in pwd of buffer'
        },
    },
    config = function (_, opts)
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local fb_actions = require('telescope').extensions.file_browser.actions
        opts.extensions = {
            file_browser = {
                theme = "dropdown",
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                mappings = {
                    -- your custom insert mode mappings
                    ["n"] = {
                        -- your custom normal mode mappings
                        ["N"] = fb_actions.create,
                        ["h"] = fb_actions.goto_parent_dir,
                        ["/"] = function()
                            vim.cmd("startinsert")
                        end,
                        ["<C-u>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_previous(prompt_bufnr)
                            end
                        end,
                        ["<C-d>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_next(prompt_bufnr)
                            end
                        end,
                    },
                },
            },
        }
        telescope.setup(opts)
        telescope.load_extension("fzy_native")
        telescope.load_extension("file_browser")
    end
}
