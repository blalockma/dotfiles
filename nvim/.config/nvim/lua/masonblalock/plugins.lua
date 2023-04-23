return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'ThePrimeagen/harpoon'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'j-hui/fidget.nvim'
    use 'weilbith/nvim-code-action-menu'

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate && :TSInstall c_sharp && :TSInstall html"
    })
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
    use 'mfussenegger/nvim-dap'

    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "Issafalcon/neotest-dotnet"
      }
    }

    use "kyazdani42/nvim-web-devicons"

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'morhetz/gruvbox' 

    use 'vim-test/vim-test'
    use 'github/copilot.vim'
    use 'OrangeT/vim-csharp'

    use 'jlcrochet/vim-razor'

    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'terrortylor/nvim-comment'
    use 'ntpeters/vim-better-whitespace'

    use 'vimwiki/vimwiki'

    local pid = vim.fn.getpid()

    -- autocomplete config
    local cmp = require 'cmp'
    cmp.setup {
        mapping = {
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
        },
        sources = {
            { name = 'nvim_lsp' },
        }
    }
end)
