call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('sources', [
 \ 'nvim-lsp',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'nvim-lsp': {
 \   'mark': 'LSP',
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true,
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
