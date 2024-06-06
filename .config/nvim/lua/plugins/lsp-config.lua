return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = { "rust-analyzer" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				--Remeber to add each language here and on the lspconfig
				ensure_installed = { "lua_ls", "tsserver", "pyright", "clangd", "html", "cssls", "jsonls", "gopls" },
			})
		end,
	},
	--LSP config for rust
	--Here you can add the debugger
	-- https://github.com/mrcjkb/rustaceanvim
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			--You need to set up each language with capabilities
			--You need to add each language manually
			lspconfig.lua_ls.setup({ capabilities })
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.document_formatting = false
				end,
			})
			lspconfig.pyright.setup({ capabilities })
			lspconfig.jsonls.setup({ capabilities })
			lspconfig.html.setup({ capabilities })
			lspconfig.cssls.setup({ capabilities })
			lspconfig.clangd.setup({ capabilities })
			lspconfig.gopls.setup({ capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		end,
	},
}
