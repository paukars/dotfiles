return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_x = {
					function()
						local ok, pomo = pcall(require, "pomo")
						if not ok then
							return ""
						end

						local timer = pomo.get_first_to_finish()
						if timer == nil then
							return ""
						end

						return "󰄉 " .. tostring(timer)
					end,
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
