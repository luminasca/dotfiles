local map = vim.api.nvim_set_keymap

-- Escを2回押すことでハイライトを消す
map('n', '<Esc><Esc>', ':nohlsearch<CR>', {noremap = true, silent = true})

-- vを2回で行末まで選択
map('v', 'v', '$h', {noremap = true})

-- Tabで対応ペアにジャンプ
map('n', '<Tab>', '%', {noremap = true})
map('v', '<Tab>', '%', {noremap = true})
