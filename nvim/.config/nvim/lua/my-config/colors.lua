-- require("tokyonight").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   transparent = false, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "dark", -- style for sidebars, see below
--     floats = "dark", -- style for floating windows
--   },
--   lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
-- })

local dracula = require("dracula")
dracula.setup({
    -- transparent_bg = true,
    -- overrides = {
    --     VertSplit = { fg = dracula.colors().bright_blue, }
    -- }
})


function ColorMyPencils(color)
    color = color or "dracula"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0,"Normal", {bg = "none" })
    -- vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
    -- vim.api.nvim_set_hl(0,"NormalNC", {bg = "none"})
end

