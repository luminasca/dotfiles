local map = vim.api.nvim_set_keymap

-- キーマップ
map('n', 'p', '<Plug>(yankround-p)', {noremap = true})
map('n', 'P', '<Plug>(yankround-P)', {noremap = true})
map('n', '<C-p>', '<Plug>(yankround-prev)', {noremap = true})
map('n', '<C-n>', '<Plug>(yankround-next)', {noremap = true})
-- 履歴取得数
vim.g.yankround_max_history = 50
-- 履歴一覧(kien/ctrlp.vim)
map('n', 'g<C-p>', ':<C-u>CtrlPYankRound<CR>',{noremap = true, silent = true})
