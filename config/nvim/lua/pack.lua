vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use 'tyru/caw.vim'
    use 'neoclide/coc.nvim'
    use 'glepnir/indent-guides.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'h1mesuke/vim-alignta'
    use 'osyo-manga/vim-anzu'
    use 'kana/vim-operator-replace'
    use 'rhysd/vim-operator-surround'
    use 'kana/vim-operator-user'
    use 'sheerun/vim-polyglot'
    use 'thinca/vim-quickrun'
    use 'kana/vim-smartinput'
    use 'tpope/vim-surround'
    use 'szw/vim-tags'
    use 'bronson/vim-trailing-whitespace'
    use 'kana/vim-textobj-user'
    use 'LeafCage/yankround.vim'
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'junegunn/fzf.vim', opt = true, cmd = {':FZFToggle'}}
    use {'sjl/gundo.vim', opt = true, cmd = {':GundoToggle'}}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'majutsushi/tagbar', opt = true, cmd = {':TagbarToggle'}}
end)
