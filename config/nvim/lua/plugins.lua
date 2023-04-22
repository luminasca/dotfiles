return{
    {'mfussenegger/nvim-dap', ft = 'py'},
    {'rcarriga/nvim-dap-ui', ft = 'py'},
    {'mfussenegger/nvim-dap-python', ft = 'py'},
    {'hrsh7th/nvim-cmp', event = 'InsertEnter, CmdlineEnter'},
    {'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter'}, 
    {'hrsh7th/cmp-buffer', event = 'InsertEnter'},
    {'hrsh7th/cmp-path', event = 'InsertEnter'},
    {'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
    {'hrsh7th/cmp-cmdline', event = 'ModeChanged'},
    {'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter'},
    {'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter'},
    {'onsails/lspkind.nvim', event = 'InsertEnter'},
    {'hrsh7th/vim-vsnip', event = 'InsertEnter'},
    {'hrsh7th/vim-vsnip-integ', event = 'InsertEnter'},
    {'rafamadriz/friendly-snippets', event = 'InsertEnter'},
    {'windwp/nvim-autopairs', event = 'InsertEnter'},
    {'j-hui/fidget.nvim', event = 'LspAttach'},
    { -- colorscheme
        'cocopon/iceberg.vim',
        config = function()
            vim.cmd([[colorscheme iceberg]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        'yioneko/nvim-yati',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },      
    'p00f/nvim-ts-rainbow',
    'm-demare/hlargs.nvim',
    'lukas-reineke/indent-blankline.nvim'
}
