-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Transparent background 
  'xiyaowong/transparent.nvim',
  -- require("transparent").setup({ -- Optional, you don't have to run setup.
  --   groups = { -- table: default groups
  --     'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
  --     'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
  --     'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
  --     'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
  --     'EndOfBuffer',
  --   },
  --   extra_groups = {
  --     "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
  --     "NvimTreeNormal", -- NvimTree
  --     "j-hui/fidget.nvim"
  --   },
  --   exclude_groups = {"fidget","neodev"}, -- table: groups you don't want to clear
  -- })

  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    -- your config goes here
    -- or just leave it empty :)
  }
}
