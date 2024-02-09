return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = {
			mappings = {
				["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
			},
		},
		buffers = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
		},
	},
}
