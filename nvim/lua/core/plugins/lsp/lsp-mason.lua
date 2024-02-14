return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		{ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		require("mason").setup({})

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = { "vimls", "lua_ls", "clangd", "rust_analyzer" },
			automatic_installation = true,
		})

		-- Configuration for automatic setup lsp servers

		local cmp_lsp = require("cmp_nvim_lsp")
		-- Capabilities for each server
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- LSP custom keymaps
		local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- set all keybinds when attaching an lsp
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

			opts.desc = "Show documentation under the cursor"
			vim.keymap.set("n", "<leader>dh", vim.lsp.buf.hover, opts)

			opts.desc = "Show diagnostic window"
			vim.keymap.set({ "n", "v" }, "<space>dq", vim.diagnostic.setloclist, opts)

			opts.desc = "Show diagnostics inline"
			vim.keymap.set({ "n", "v" }, "<leader>dl", vim.diagnostic.open_float, opts)

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		-- Automatically calls all servers setup function and add on_attach and capabilities
		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			-- Custom configuration for lua_ls server
			["lua_ls"] = function()
				local lsp_config = require("lspconfig")
				lsp_config.lua_ls.setup({
					-- capabilities = capabilities,
					-- on_attach = on_attach,
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
			end,
		})

		-- installs some tools automatically
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"eslint_d",
				"isort",
				"black",
				"pylint",
				"clangd",
				"cpplint",
				"codelldb",
			},
		})
	end,
}
