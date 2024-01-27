local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Plugin manager
    use("wbthomason/packer.nvim")

    -- LSP plugins

    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "nvimtools/none-ls.nvim",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-nvim-lsp",
    })

    --FileTree plugin
    use({
        "nvim-neo-tree/neo-tree.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    })

    -- Colorscheme plugin
    use("folke/tokyonight.nvim")

    -- Telescope plugin
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    })

    -- Code action extension for Telescope
    use({ "nvim-telescope/telescope-ui-select.nvim" })

    -- Misc plugins
    -- use "arnamak/stay-centered.nvim"
    -- require("stay-centered").setup();

    use("terrortylor/nvim-comment")

    -- Undotree plugin
    use("mbbill/undotree")

    -- Color plugin
    use("NvChad/nvim-colorizer.lua")

    -- Terminal plugin
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
    })

    -- Peek plugin
    use({ "toppair/peek.nvim", run = "deno task --quiet build:fast" })

    -- Lualine status bar
    use("nvim-lualine/lualine.nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
