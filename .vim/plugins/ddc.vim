call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('sources', [
 \ 'vim-lsp',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'vim-lsp': {
 \   'mark': 'LSP',
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true,
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
