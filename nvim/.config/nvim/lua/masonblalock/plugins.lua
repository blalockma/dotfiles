return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'ThePrimeagen/harpoon'
    use 'morhetz/gruvbox'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
end)
