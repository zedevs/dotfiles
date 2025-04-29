return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
      hidden = true,
      ignored = true,
    },
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
        },
      },
    },
  },
}
