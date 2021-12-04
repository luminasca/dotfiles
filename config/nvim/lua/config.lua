-- 2バイト文字の描画
vim.o.ambiwidth = 'double'

-- メッセージ表示欄を1行確保
vim.o.cmdheight = 1

-- 不可視文字を表示
vim.wo.list = true

-- 行番号を表示
vim.o.number = true

-- カラースキーム
vim.cmd'colorscheme iceberg'
vim.o.background = 'dark'

-- ステータスラインの表示
vim.o.laststatus = 2

-- Tabで挿入するとき、スペースを使う
vim.o.expandtab = true

-- インデント設定
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.cmd'filetype plugin indent on'

-- クリップボード設定
vim.o.clipboard = 'unnamedplus'

-- テキストの折返し
vim.o.wrap = true
-- 自動改行を無効化
vim.o.textwidth = 0
-- 80文字目にラインを入れる
vim.wo.colorcolumn = '80'

-- 大文字と小文字を区別しない
vim.o.ignorecase = true
-- 検索文字に大文字があるときは、大文字と小文字を区別する
vim.o.smartcase = true
-- インクリメンタルサーチ
vim.o.incsearch = true
-- 検索マッチテキストをハイライト
vim.o.hlsearch = true

-- バックスペースでなんでも消す
vim.o.backspace = 'indent,eol,start'

-- SwapファイルとBackupファイルの無効化
vim.o.writebackup = false
vim.o.backup = false
vim.o.swapfile = false

-- カーソルの位置を表示する
vim.o.ruler = true

-- シンタックスハイライト On
vim.cmd'syntax enable'
vim.cmd'syntax on'
