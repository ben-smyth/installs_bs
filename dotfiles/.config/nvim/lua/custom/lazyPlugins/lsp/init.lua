-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
-- the above link provides the name required for this list
local declared_servers = {
	"pyright",
	"gopls",
	"lua_ls",
	"html",
	-- "htmx",
	"cssls",
	-- "groovyls",
	"dockerls",
	"docker_compose_language_service",
	"ansiblels",
	"yamlls",
	"jsonls",
	"puppet",
	"ruby_lsp",
	"bashls"
}

return {
	{
		"ms-jpq/coq_nvim",
		branch = "coq",
		build = ":COQdeps",
		dependencies = {
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},
	},
	{
		-- LSP Configuration with Mason and COQ
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"ms-jpq/coq_nvim",
		},
		version = "v1.6.0",
		config = function()
			-- Setup LSP servers with Mason
			require("mason").setup({
				ui = {
					border = "rounded",
					border_chars = {
						top = "─",
						bottom = "─",
						left = "│",
						right = "│",
						top_left = "╭",
						top_right = "╮",
						bottom_left = "╰",
						bottom_right = "╯",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = declared_servers,
				automatic_installation = true,
			})

			-- Require COQ after ensuring settings are applied
			local coq = require("coq")

			-- Define on_attach function
			local on_attach = function(client, bufnr)
				local nmap = function(keys, func, desc)
					if desc then desc = "LSP: " .. desc end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			end

			-- Extend capabilities with COQ
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = coq.lsp_ensure_capabilities(capabilities)

			-- Configure LSP servers
			local servers = declared_servers

			local lspconfig = require("lspconfig")

			for _, server in ipairs(servers) do
				lspconfig[server].setup(coq.lsp_ensure_capabilities({
					on_attach = on_attach,
				}))
			end
		end,
	},
}
