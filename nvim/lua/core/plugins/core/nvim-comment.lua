return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	opts = {
		toggler = {
			---Line-comment toggle keymap
			line = "<leader>cc",
			---Block-comment toggle keymap
			block = "<leader>kc",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = "gc",
			---Block-comment keymap
			block = "gb",
		},
	},
}
