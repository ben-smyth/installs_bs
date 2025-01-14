vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("custom.config")

-- Load lazy plugins
require("lazy").setup({
  { import = "custom.lazyPlugins" },
  { import = "custom.lazyPlugins.lsp.init" },
}, {
    defaults = { lazy = false },
    checker = { enabled = true },
    ui = { border = "rounded" },
    performance = {
      cache = {
	enabled = true,
      },
      rtp = {
	disabled_plugins = {
	  "lualine",
	},
      },
    },
    debug = false,
  })


require("custom.scripts")
require("custom.keymaps")

require("markview").setup({
    __inside_code_block = false, -- Do not render Markdown, HTML, or LaTeX inside code blocks
    filetypes = { "markdown", "quarto", "rmd" }, -- Enable for specific file types
    injections = { enable = false }, -- Disable Tree-sitter injections to avoid conflicts
    highlight_groups = "dynamic", -- Use dynamic highlight groups
    split_conf = { split = "right" }, -- Preview opens to the right
    initial_state = true, -- Automatically enable previews for new buffers
    max_file_length = 1000, -- Set max file length for rendering
    debounce = 100, -- Time in ms to wait before a redraw
})
