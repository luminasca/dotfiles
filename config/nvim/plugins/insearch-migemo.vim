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

