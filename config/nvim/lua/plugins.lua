return {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-dap-python',
    'shaunsingh/nord.nvim',
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    "vim-denops/denops.vim",
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },
    'nvim-treesitter/nvim-treesitter',
    'yioneko/nvim-yati',
    'haringsrob/nvim_context_vt',
    'm-demare/hlargs.nvim',
    'lukas-reineke/indent-blankline.nvim',
    {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end
    }
}
