vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { "nvim-tree/nvim-web-devicons" }
    }
    use 'simrat39/symbols-outline.nvim'

    use({
        'Mofiqul/dracula.nvim'
    })
    -- use 'folke/tokyonight.nvim'
    -- use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')

    -- git plugins
    use('tpope/vim-fugitive')
    use('sindrets/diffview.nvim')
    use('mhinz/vim-signify')
    -- use('airblade/vim-gitgutter')

    use { 'numToStr/Comment.nvim' }
    -- use('RRethy/nvim-treesitter-textsubjects')

    -- ------------- NAVIGATION ----------------------------------
    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --     },
    --     tag = 'nightly' -- optional, updated every week. (see issue #1193)
    -- }

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    -- use {
    --     "nvim-telescope/telescope-file-browser.nvim",
    --     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    -- }
    -- ------------ NAVIGATION ----------------------------------

    --use ('JoosepAlviste/nvim-ts-context-commentstring')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use('windwp/nvim-ts-autotag')
    -- use('jose-elias-alvarez/null-ls.nvim')
    use('sbdchd/neoformat')
    use "lukas-reineke/indent-blankline.nvim"

    -- use 'karb94/neoscroll.nvim'

    use 'nvim-lua/lsp-status.nvim'
    use 'stevearc/qf_helper.nvim';
    -- use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

    -- optional
    use { 'junegunn/fzf', run = function()
        vim.fn['fzf#install']()
    end
    }

    use {
        "benfowler/telescope-luasnip.nvim",
        module = "telescope._extensions.luasnip", -- if you wish to lazy-load
    }
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'mrcjkb/rustaceanvim', requires = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' } }

    use 'Exafunction/codeium.vim'
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/neotest-go",
            "nvim-neotest/nvim-nio",
            "vim-test/vim-test",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-vim-test",
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
        end,
    }
    use 'Civitasv/cmake-tools.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })
    use {
        "folke/trouble.nvim"
    }
end)
