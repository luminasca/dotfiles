"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
