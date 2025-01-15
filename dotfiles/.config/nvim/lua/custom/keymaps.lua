--
-- BINDINGS
--

-- Telescope keymaps
local telescope = require('telescope.builtin')
local telescope_live_grep_args = require('telescope').extensions.live_grep_args
vim.keymap.set('n', '<leader>gf', function()
    telescope.find_files({ initial_mode = "insert", find_command = {'rg', '--files', '--hidden', '-g', '!.git' }}) -- Files in insert mode
end, { desc = "Find Files Insert Mode)" })

vim.keymap.set('n', 'T', function()
    telescope_live_grep_args.live_grep_args({ initial_mode = "insert" }) -- Grep in insert mode
end, { desc = "Live Grep (Normal Mode)" })

vim.keymap.set('n', '<Tab>', function()
    telescope.buffers({ initial_mode = "normal" }) -- Buffers in normal mode
end, { desc = "Buffers (Normal Mode)" })

vim.keymap.set('n', 'F', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- COQ
-- Ensure <CR> always inserts a newline
vim.api.nvim_set_keymap(
  "i",
  "<CR>",
  [[pumvisible() ? "\<C-e>\<CR>" : "\<CR>"]],
  { expr = true, noremap = true }
)

-- Map <C-e> to select a completion if the menu is visible
vim.api.nvim_set_keymap(
  "i",
  "<C-e>",
  [[pumvisible() ? "<C-y>" : "<C-e>"]],
  { expr = true, noremap = true }
)
vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.cmd('command! Bcr BufferCloseBuffersRight')
vim.cmd('command! Bca BufferCloseAllButCurrent')
vim.cmd('command! Bc BufferClose')
vim.cmd('command! Nvt NvimTreeToggle')
vim.cmd('command! Nvr NvimTreeRefresh')
vim.cmd('command! GIF GoIfErr')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<S-TAB>', ':BufferPrevious<CR>', opts)
map('n', '<C-s>', ':NvimTreeToggle<CR>', opts)
