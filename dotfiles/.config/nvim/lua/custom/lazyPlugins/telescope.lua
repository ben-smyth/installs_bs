-- Fuzzy Finder (files, lsp, etc)
local M = {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
        "nvim-telescope/telescope-live-grep-args.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
}

function M.config()
    require("telescope").load_extension("live_grep_args")

    local actions = require("telescope.actions")

    require("telescope").setup({
        defaults = {
            mappings = {
                i = { -- Insert mode mappings
                    ["<C-v>"] = actions.select_vertical, -- Open in vertical split
                    ["<C-s>"] = actions.select_horizontal, -- Open in horizontal split
                },
                n = { -- Normal mode mappings
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-s>"] = actions.select_horizontal,
                    ["q"] = require('telescope.actions').close, -- Close Telescope with Q in normal mode
                },
            },
        },
    })

    -- Load fzf-native if available
    pcall(require("telescope").load_extension, "fzf")
end

return M
