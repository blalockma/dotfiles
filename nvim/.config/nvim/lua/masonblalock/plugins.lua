return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'ThePrimeagen/harpoon'
    use 'morhetz/gruvbox' 
    use { "nvim-telescope/telescope-file-browser.nvim" }
end)
