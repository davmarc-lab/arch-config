return {
	"toppair/peek.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		run = "deno task --quiet build:fast",
		auto_load = true,
		close_on_bdelete = true,
		syntax = true,
		theme = "dark",
		update_on_change = true,
		app = { "firefox", "--new-window" },
		filetype = { "markdown" },
		throttle_at = 200000,
		throttle_time = "auto",
	},
}
