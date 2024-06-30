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
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
  filters = {
    dotfiles = false,
  },
}
  end,
}
