local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                        -- Packer plugin manager
    use "folke/tokyonight.nvim"                         -- Paper colorscheme
    use 'terrortylor/nvim-comment'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
    use 'nvim-lualine/lualine.nvim'                     -- Lualine for status bar, for git too
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {'nvim-lua/plenary.nvim'},
        },
    }
    use { 'neoclide/coc.nvim', branch='release' }       -- Coc intellisense for all language
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use 'mbbill/undotree'
    use 'NvChad/nvim-colorizer.lua'
    -- use('nvim-treesitter/playground')        -- PLuging for modify parser in a file

    -- terminal in nvim
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })      -- Peek markdown pages

    use({ "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    	end
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

