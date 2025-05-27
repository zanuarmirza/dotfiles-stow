return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    -- git plugins
    { 'sindrets/diffview.nvim' },
    -- use('airblade/vim-gitgutter')

    -- use('RRethy/nvim-treesitter-textsubjects')

    -- ------------- NAVIGATION ----------------------------------
    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --     },
    --     tag = 'nightly' -- optional, updated every week. (see issue #1193)
    -- }


    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    -- use {
    --     "nvim-telescope/telescope-file-browser.nvim",
    --     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    -- }
    -- ------------ NAVIGATION ----------------------------------

    --use ('JoosepAlviste/nvim-ts-context-commentstring')
    { 'windwp/nvim-ts-autotag' },
    -- use('jose-elias-alvarez/null-ls.nvim')

    -- use 'karb94/neoscroll.nvim'

    -- use { 'kevinhwang91/nvim-bqf', ft = 'qf' }


    { 'nvim-lua/plenary.nvim' },
    { 'ray-x/go.nvim' },
    { 'ray-x/guihua.lua' },
    { 'mrcjkb/rustaceanvim',   dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' } },

    {
        'Exafunction/windsurf.vim',
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            -- vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            -- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
            --     { expr = true, silent = true })
            -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
            --     { expr = true, silent = true })
            -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

            vim.keymap.set('i', '<M-Tab>', function() return vim.fn['codeium#Accept']() end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    },
}
