return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    -- git plugins
    {'sindrets/diffview.nvim'},
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
    {'windwp/nvim-ts-autotag'},
    -- use('jose-elias-alvarez/null-ls.nvim')

    -- use 'karb94/neoscroll.nvim'

    -- use { 'kevinhwang91/nvim-bqf', ft = 'qf' }


    {'nvim-lua/plenary.nvim'},
    {'ray-x/go.nvim'},
    {'ray-x/guihua.lua'},
    { 'mrcjkb/rustaceanvim', dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' } },

    {'Exafunction/codeium.vim'},
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
