return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		--Toggle is a boolean flag
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<C-b>", ":Neotree focus<CR>", {})
		vim.keymap.set("n", "<C-l>", ":wincmd p<CR>", {})
	end,
}
