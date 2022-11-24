vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()

    use{'wbthomason/packer.nvim', opt = true}

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    
    use {'cocopon/iceberg.vim', opt = true}
    
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap-python'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'nvim-treesitter/nvim-treesitter'
    use 'yioneko/nvim-yati'
    use 'p00f/nvim-ts-rainbow'
    use 'haringsrob/nvim_context_vt'
    use 'm-demare/hlargs.nvim'

end)
