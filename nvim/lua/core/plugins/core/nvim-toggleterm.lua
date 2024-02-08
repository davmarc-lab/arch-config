return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	opts = {
		direction = "float",
		float_opts = {
			border = "curved",
		},
		winbar = {
			enabled = false,
			name_formatter = function(term)
				return term.name
			end,
		},
	},
}
