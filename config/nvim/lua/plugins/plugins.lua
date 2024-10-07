return {
   'mfussenegger/nvim-dap-python',
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'shaunsingh/nord.nvim',
    "lambdalisue/vim-seethrough",
    "tani/vim-artemis",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'neovim/nvim-lspconfig',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'nvim-treesitter/nvim-treesitter',
    'yioneko/nvim-yati',
    'haringsrob/nvim_context_vt',
    'm-demare/hlargs.nvim',
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
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
