call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', ['nvim-lsp', 'around', 'vsnip', 'file'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \ 'matchers': ['matcher_head'],
      \ 'sorters': ['sorter_rank'],
      \ 'converters': ['converter_remove_overlap'],
      \ },
      \ 'around': {'mark': 'A'},
      \ 'nvim-lsp': {
      \ 'mark': 'L',
      \ 'forceCompletionPattern': '\.\w*|:\w*|->\w*',
      \ },
      \ 'file': {
      \   'mark': 'file',
      \   'isVolatile': v:true,
      \   'forceCompletionPattern': '\S/\S*'
      \ }})

call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

"inoremap <silent><expr> <TAB>
"      \ ddc#map#pum_visible() ? '<C-n>' :
"      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"      \ '<TAB>' : ddc#map#manual_complete()
"inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

call ddc#enable()

inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
