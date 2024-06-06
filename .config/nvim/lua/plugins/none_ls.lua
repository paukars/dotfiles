return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local venv_path =
			'import sys; sys.path.append("/home/paukars/.local/share/nvim/mason/packages/pylint/venv/lib/python3.12/site-packages"); import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)'
		null_ls.setup({
			sources = {
				--You need to add each formatter and linter manually for each language
				--Some of them are localated on the none-ls-extras.nvim
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.pylint.with({
					extra_args = { "--init-hook", venv_path },
				}),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.isort,
				--You need to run npm install eslint --save-dev
				--And npx eslint --init on each directory of your javascript project
				--And live-server to launch liveserver
				require("none-ls.diagnostics.eslint"),
				require("none-ls.code_actions.eslint"),
				require("none-ls.formatting.eslint"),
				--Configuration for C++
				require("none-ls.diagnostics.cpplint"),
				null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.djlint,
                null_ls.builtins.formatting.djhtml,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format Code" })
	end,
}
