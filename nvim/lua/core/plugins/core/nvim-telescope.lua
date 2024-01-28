return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	priority = 1000,
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy finder find files" })
		vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy finder find strings" })
	end,
}
