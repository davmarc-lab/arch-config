return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr
			-- set key binds

			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>d", vim.diagnostics.open_float(), opts)

			opts.desc = "Show documentation under the cursor"
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["marksman"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["intelephense"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["vimls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set("n", "<leader>wl", function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- vim.keymap.set("n", "<leader>f", function()
		--     vim.lsp.buf.format({ async = false })
		-- end, opts)
	end,
}
