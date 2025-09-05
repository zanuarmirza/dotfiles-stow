return {
    -- add dracula
    -- {
    --     "Mofiqul/dracula.nvim",
    --     lazy = false,
    --     config = function()
    --         vim.cmd [[colorscheme dracula]]
    --     end
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd [[colorscheme tokyonight-night]]
        end
    }
    -- Configure LazyVim to load dracula
}
