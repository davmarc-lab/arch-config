-- Mason setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- Mason-config setup
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "clangd", "html", "cssls", "intelephense", "marksman", "bashls" },
    automatic_installation = true,
})

-- lsp-config setup

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    capabilities = capabilities
})
lspconfig.clangd.setup({
    capabilities = capabilities
})
lspconfig.tsserver.setup({
        capabilities = capabilities
})
lspconfig.html.setup({
    capabilities = capabilities
})
lspconfig.cssls.setup({
    capabilities = capabilities
})
lspconfig.intelephense.setup({
    capabilities = capabilities
})
lspconfig.marksman.setup({
    capabilities = capabilities
})
lspconfig.bashls.setup({
    capabilities = capabilities
})

-- LSP keymaps

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        local opts = { buffer = ev.buf }

        -- Variables action
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- Lines actions
        vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)           -- Display on hover information
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)      -- Display user functions signature
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)         -- !DANGER! Renames all variable or function names
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Shows code actions for errors or warnings etc.
        vim.keymap.set("n", "<space>f", function()                          -- Format all document
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
