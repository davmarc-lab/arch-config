return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
            snippet = {
                expand = function (args)
                    luasnip.lsp_expand(args.body)
                end
            },
			window = {
				completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<TAB>"] = cmp.mapping.select_next_item(),
				["<S-TAB>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'path' },
				{ name = 'buffer' },
                -- { name = "vsnip" }, -- For vsnip users.
			}),
		})
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
		-- require("lspconfig")["lua_ls"].setup({
		-- 	capabilities = capabilities,
		-- })
	end,
}
