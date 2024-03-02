return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")

		-- Common snippets
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Autocompletition icons
		local lspkind = require("lspkind")

		local compare = cmp.config.compare

		cmp.setup({
			-- Autocompletition icons
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 30,
					ellipsis_char = " ...",
					show_labelDetails = true,
					before = function(_, vim_item)
						return vim_item
					end,
				}),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				-- completition widows border
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<TAB>"] = cmp.mapping.select_next_item(),
				["<S-TAB>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "jupynium", priority = 1000 },
				{ name = "nvim_lsp", priority = 100 },
				{ name = "luasnip", priority = 100 },
				{ name = "path", priority = 100 },
				{ name = "buffer", priority = 100 },
			}),
			sorting = {
				priority_weight = 1.0,
				comparators = {
					compare.score, -- Jupyter kernel completion shows prior to LSP
					compare.recently_used,
					compare.locality,
				},
			},
		})
	end,
}
