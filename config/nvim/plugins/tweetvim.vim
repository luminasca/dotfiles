" アイコン表示
let g:tweetvim_display_icon = 1
" 1ページのツイート表示数
let g:tweetvim_tweet_per_page = 200

let g:tweetvim_cache_size     = 50
let g:tweetvim_include_rts    = 1
nnoremap ,ut :<C-u>Unite tweetvim<CR>
nnoremap ,tm :<C-u>TweetVimMentions<CR>
nnoremap ,tl :<C-u>TweetVimHomeTimeline<CR>
nnoremap ,ts :<C-u>TweetVimSay<CR>

" 自動更新間隔（秒）
let s:tweetvim_update_interval_seconds = 120
let s:tweetvim_timestamp = reltime()[0]

function! s:tweetvim_autoupdate()
    let current = reltime()[0]
    if current - s:tweetvim_timestamp > s:tweetvim_update_interval_seconds
        call feedkeys("\<Plug>(tweetvim_action_reload)")
        let s:tweetvim_timestamp = current
    endif
    call feedkeys(mode() ==# 'i' ? "\<C-g>\<ESC>" : "g\<ESC>", 'n')
endfunction

function! s:tweetvim_setup_autoupdate()
    augroup vimrc-tweetvim-autoupdate
        autocmd!
        autocmd CursorHold * call <SID>tweetvim_autoupdate()
    augroup END
endfunction

" 自動更新開始と終了用コマンド
command! -nargs=0 TweetVimAutoUpdate call <SID>tweetvim_setup_autoupdate()
command! -nargs=0 TweetVimStopAutoUpdate autocmd! vimrc-tweetvim-autoupdate
