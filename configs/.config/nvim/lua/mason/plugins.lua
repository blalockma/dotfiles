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

    use 'preservim/nerdtree'
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate && :TSInstall all"
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use("folke/tokyonight.nvim")


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
    -- omnisharp lsp config
    require'lspconfig'.omnisharp.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end,
        cmd = { "/home/mason/omnisharp/run", "--languageserver" , "--hostPID", tostring(pid) },
    }
end)
