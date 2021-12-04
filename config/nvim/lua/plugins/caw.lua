local map = vim.api.nvim_set_keymap

-- 行の最初の文字の前に、コメント文字をトグル
map('n', '<Leader>c', '<Plug>(caw:hatpos:toggle)', {noremap = true})
map('v', '<Leader>c', '<Plug>(caw:hatpos:toggle)', {noremap = true})

-- 行頭にコメントをトグル
map('n', '<Leader>,', '<Plug>(caw:zeropos:toggle)', {noremap = true})
map('v', '<Leader>,', '<Plug>(caw:zeropos:toggle)', {noremap = true})
