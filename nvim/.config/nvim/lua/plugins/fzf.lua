return { {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({
            { "telescope" },
            actions = {
                -- Below are the default actions, setting any value in these tables will override
                -- the defaults, to inherit from the defaults change [1] from `false` to `true`
                files = {
                    -- true,        -- uncomment to inherit all the below in your custom config
                    -- Pickers inheriting these actions:
                    --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
                    --   tags, btags, args, buffers, tabs, lines, blines
                    -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
                    -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
                    -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
                    ["enter"]  = FzfLua.actions.file_edit_or_qf,
                    ["ctrl-s"] = FzfLua.actions.file_split,
                    ["ctrl-v"] = FzfLua.actions.file_vsplit,
                    ["ctrl-t"] = FzfLua.actions.file_tabedit,
                    ["alt-q"]  = FzfLua.actions.file_sel_to_qf,
                    ["alt-Q"]  = FzfLua.actions.file_sel_to_ll,
                    ["alt-i"]  = FzfLua.actions.toggle_ignore,
                    ["alt-h"]  = FzfLua.actions.toggle_hidden,
                    ["alt-f"]  = FzfLua.actions.toggle_follow,
                },
            },
            winopts = {
                preview = {
                    layout = "vertical"
                }
            },
            -- files   = {
            --     { fzf_opts = { ['--keep-right'] = '' } }
            -- },
        })

        local m = require("fzf-lua")

        vim.keymap.set('n', '<leader>ff', "<cmd>FzfLua files<CR>")       -- find files (fuzzy)
        vim.keymap.set('n', '<leader>fq', "<cmd>FzfLua quickfix<CR>")       -- quickfix
        vim.keymap.set('n', '<leader>fb', "<cmd>FzfLua buffers<CR>")     -- show buffer
        vim.keymap.set('n', '<M-s>', "<cmd>FzfLua git_status<CR>")       -- git status
        vim.keymap.set('n', '<M-p>', "<cmd>FzfLua git_files<CR>")        -- search files at git
        vim.keymap.set('n', '<M-P>', "<cmd>FzfLua commands<CR>")         -- list commands
        vim.keymap.set('n', '<leader>fr', "<cmd>FzfLua resume<CR>")      -- show latest telescope result
        vim.keymap.set('n', 'gI', "<cmd>FzfLua lsp_implementations<CR>") -- list implementation
        -- vim.keymap.set('n', '<leader>fs', m.lsp_document_symbols, {}) -- show documents symbols
        vim.keymap.set('n', '<leader>gt', "<cmd>FzfLua git_status<CR>")  -- show git status list
        vim.keymap.set('n', '<leader>/', "<cmd>FzfLua lgrep_curbuf<CR>") -- show git status list

        vim.keymap.set("n", "<leader>mr", "<cmd>FzfLua marks<CR>", {})

        vim.keymap.set('n', '<leader>o', function()
            m.oldfiles({
                fzf_opts                = { ['--keep-right'] = '' },
                prompt_title            = 'Project History',
                cwd_only                = true,
                stat_file               = true, -- verify files exist on disk
                include_current_session = true, -- include bufs from current session
            })
        end, {})                                -- show oldfiles

        vim.keymap.set('n', '<leader>O', function()
            m.buffers()
        end, {})                                -- show oldfiles


        vim.keymap.set('n', '<leader>fg', function()
            m.grep({ search = vim.fn.input("Grep > ") });
        end)

        vim.keymap.set('n', '<leader>fG', function()
            m.grep({ search = vim.fn.input("Grep > "), rg_opts = '--line-number --column --color=always --hidden' });
        end)

        vim.keymap.set('n', '<leader>flg', function()
            m.live_grep();
        end)

        vim.keymap.set('n', '<leader>flG', function()
            m.live_grep({ rg_opts = '--multiline --line-number --column --color=always --hidden' });
        end)
    end
},
    -- optional
    {
        'junegunn/fzf',
        build = function()
            vim.fn['fzf#install']()
        end
    },
}
