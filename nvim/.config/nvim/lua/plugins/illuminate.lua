return {
  "RRethy/vim-illuminate",
  event = { "CursorMoved", "InsertLeave" },
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    filetypes_denylist = {
      "neo-tree",
      "Telescope",
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
