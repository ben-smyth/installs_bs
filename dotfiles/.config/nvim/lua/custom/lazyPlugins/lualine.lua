local M = {
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',
	-- See `:help lualine.txt`
	-- event = "VeryLazy",
	lazy = false,
}

function M.config()
	local my_filename = require("lualine.components.filename"):extend()
	my_filename.apply_icon = require("lualine.components.filetype").apply_icon
	my_filename.colored = true

	local filename_with_path = { my_filename, path = 1}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			-- globalstatus = true, -- to have just one lualine, the inactive_* won't work
			component_separators = "|",
			section_separators = "",
		},
		extensions = { "nvim-tree" },
	})
end

return M
