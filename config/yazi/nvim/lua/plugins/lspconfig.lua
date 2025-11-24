local lspconfig = require('lspconfig')
lspconfig.nimlsp.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['nimlsp'] = {},
  },
}

lspconfig.python_lsp_server.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['python-lsp-server'] = {},
  },
}
