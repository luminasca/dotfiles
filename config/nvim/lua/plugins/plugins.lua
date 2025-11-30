return {
    'mfussenegger/nvim-dap-python',
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'shaunsingh/nord.nvim',
    "lambdalisue/vim-seethrough",
    "tani/vim-artemis",
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
            'LumaKernel/ddc-source-file',
        }
    },
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
        config = true,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim" },
            { "neovim/nvim-lspconfig" },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = true,
        keys = {
        { "<C-space>", "<cmd>lua vim.lsp.completion.get()  <CR>", mode = "i" },
        { "gh",        "<cmd>lua vim.lsp.buf.hover()       <CR>" },
        { "gd",        "<cmd>lua vim.lsp.buf.definition()  <CR>" },
        { "gD",        "<cmd>lua vim.lsp.buf.declaration() <CR>" },
        },
    },
    --[[
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    ]]--
}
