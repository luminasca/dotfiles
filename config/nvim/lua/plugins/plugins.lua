return {
   'mfussenegger/nvim-dap-python',
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'shaunsingh/nord.nvim',
    "lambdalisue/vim-seethrough",
    "Shougo/pum.vim",
    "tani/vim-artemis",
    "vim-denops/denops.vim",
    "Shougo/ddc.vim",
    "Shougo/ddc-source-lsp",
    "LumaKernel/ddc-source-file",
    "Shougo/ddc-ui-pum",
    "Shougo/ddc-source-line",
    "matsui54/ddc-source-buffer",
    "Shougo/ddc-source-around",
    "tani/ddc-fuzzy",
    "uga-rosa/ddc-previewer-floating",
    "Shougo/ddc-filter-converter_remove_overlap",
    "Shougo/ddc-source-cmdline",
    "Shougo/ddc-filter-sorter_rank",
    "Shougo/ddc-filter-matcher_head",
    "williamboman/mason.nvim",
    " williamboman/mason-lspconfig.nvim",
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
    }
}
