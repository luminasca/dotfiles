vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
    use{'wbthomason/packer.nvim', opt = true}
    use'kyazdani42/nvim-web-devicons'
    use'Shougo/ddc.vim'
    use{'Shougo/ddc-around', requires = {'Shougo/ddc.vim', opt = true}}
    use{'Shougo/ddc-converter_remove_overlap', requires = {'Shougo/ddc.vim', opt = true}}
    use{'Shougo/ddc-matcher_head', requires = {'Shougo/ddc.vim', opt = true}}
    use{'Shougo/ddc-sorter_rank', requires = {'Shougo/ddc.vim', opt = true}}
    use'Shougo/pum.vim'
    use'vim-denops/denops.vim'
    use{'LumaKernel/ddc-file', requires = {'Shougo/ddc.vim', opt = true}}
    use'theblob42/drex.nvim'
    use'tyru/caw.vim'
    use'glepnir/indent-guides.nvim'
    use'mfussenegger/nvim-dap'
    use'rcarriga/nvim-dap-ui'
    use'neovim/nvim-lspconfig'
    use'p00f/nvim-ts-rainbow'
    use'h1mesuke/vim-alignta'
    use'osyo-manga/vim-anzu'
    use'kana/vim-operator-replace'
    use'rhysd/vim-operator-surround'
    use'kana/vim-operator-user'
    use'sheerun/vim-polyglot'
    use'thinca/vim-quickrun'
    use'Shougo/vimproc.vim'
    use'kana/vim-smartinput'
    use'tpope/vim-surround'
    use'szw/vim-tags'
    use'bronson/vim-trailing-whitespace'
    use'kana/vim-textobj-user'
    use'LeafCage/yankround.vim'

    use{'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use{'junegunn/fzf.vim', opt = true, cmd = {':FZFToggle'}}
    use{'sjl/gundo.vim', opt = true, cmd = {':GundoToggle'}}
    use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use{'majutsushi/tagbar', opt = true, cmd = {':TagbarToggle'}}
end)
