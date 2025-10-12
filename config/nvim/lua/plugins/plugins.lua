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
    },
    {
        'Shougo/ddc.vim',
        dependencies = {
            'vim-denops/denops.vim',
            'Shougo/ddc-ui-native',
            'Shougo/ddc-source-around',
            'Shougo/ddc-source-lsp',
            'tani/ddc-fuzzy',
            'Shougo/ddc-filter-matcher_head',
            'Shougo/ddc-filter-sorter_rank',
        }
    }
}
