return {
"nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
  view = {
    width = 30,
  },
  filters = {
    dotfiles = false,
  },
}
  end,
}
