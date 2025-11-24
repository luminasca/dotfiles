vim.lsp.config('*', {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
})

vim.fn["ddc#custom#patch_global"]('ui', 'native')
vim.fn["ddc#custom#patch_global"]('sources', {'lsp', 'around', 'file'})
vim.fn["ddc#custom#patch_global"]('sourceOptions', {
  ['lsp'] = {
    mark = "[LSP]",
    matchers = {'matcher_head'},
  },
  _ = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_rank'},
    ignoreCase = true,
    minAutoCompleteLength = 2,
    mark = '[A]',
  },
  ['file'] = {
    mark = "[File]",
    isVolatile = true,
    forceCompletionPattern = {'\bS/\bS*'},
  },
})
vim.fn["ddc#enable"]()
