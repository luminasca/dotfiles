if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml = '~/.config/nvim/dein.toml'
    let s:lazy_toml = '~/.config/nvim/dein_lazy.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

augroup MyAutoCmd
  autocmd!
augroup END

"call map(dein#check_clean(), "delete(v:val, 'rf')")

imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap “” “”<Left>
imap ” ”<Left>
imap "" ""<Left>
imap <> <><Left>
imap “ “ <Left>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap < "zdi^V(<C-R>z><ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

set t_Co=256
set nocompatible
" UTF-8 環境でないとうまく表示されない
set encoding=utf-8
scriptencoding utf-8
" フォントサイズはお好みで
set guifont=PlemolJP\ Console\ Bold:h14
" こっちは日本語フォント
set guifontwide=PlemolJP\ Console\ Bold:h14
" gvim用フォント
set guifont=PlemolJP\ Console\ Bold\ 14

" icebergの設定
colorscheme iceberg
set background=dark

" ステータスライン StatusLine
set laststatus=2 " 常にステータスラインを表示

" ハイライトを有効化する
syntax enable
syntax on

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab

" インデント設定
set tabstop=4
set shiftwidth=4
filetype plugin indent on

" 無名レジスタに入るデータを、*レジスタにも入れる。
" set clipboard+=unnamed
set clipboard=unnamedplus

set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる

" 検索関係
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" 編集関係
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set hidden              " バッファを閉じる代わりに隠す(Undo履歴を残すため)
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" Swapファイル?Backupファイル?前時代的すぎなので全て無効化する
set nowritebackup
set nobackup
set noswapfile

"表示関係
set list                " 不可視文字の可視化
set number              " 行番号の表示

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" .から始まるファイルおよび.pycで終わるファイルを不可視パターンに
let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 行の最初の文字の前にコメント文字をトグル
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nmap <Leader>, <Plug>(caw:zeropos:toggle)
vmap <Leader>, <Plug>(caw:zeropos:toggle)

" Gundo.vimの設定
nmap U :<C-u>GundoToggle<CR>

"open-browserの設定
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)

" Tagbarの設定
nmap <silent><Leader>t :TagbarToggle<CR>

"検索関係
" incsearch-vimの設定
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

let g:incsearch#magic = '\v'

" vim-browser-reload-linuxの設定
let g:returnAppFlag = 1

" insearch-easymotionの設定
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<C-l>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" insearch-fuzzyの設定
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

" insearch-migemoの設定
function! s:config_migemo(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#migemo#converter(),
  \   ],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<C-l>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> m/ incsearch#go(<SID>config_migemo())
noremap <silent><expr> m? incsearch#go(<SID>config_migemo({'command': '?'}))
noremap <silent><expr> mg/ incsearch#go(<SID>config_migemo({'is_stay': 1}))

" tmux用の設定
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
