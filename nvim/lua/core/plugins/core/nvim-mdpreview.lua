return {
	"iamcco/markdown-preview.nvim",
    keys = {
        { "<leader>po", ":MarkdownPreview<CR>", desc = { "Markdown Preview Open" } },
    },
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
