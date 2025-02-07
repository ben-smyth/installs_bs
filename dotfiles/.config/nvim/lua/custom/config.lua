vim.o.hlsearch = true
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

-- COQ configuration
vim.g.coq_settings = {
  auto_start = true,
  keymap = {
    recommended = false,
    jump_to_mark = "",
    bigger_preview = "",
    manual_complete = "<C-n>",
  },
  clients = {
    lsp = { enabled = true },
    snippets = { enabled = false },
    tree_sitter = { enabled = true },
  },
  display = {
    -- Disable the Message of the Day
    pum = {
      fast_close = false, -- Keep completion open when typing
    },
    preview = {
      border = "rounded", -- Rounded preview border
    },
    icons = {
      mode = "short", -- Use short icons
    },
    statusline = {
      helo = false
    },
  },
}
