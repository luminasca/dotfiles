local mason = require("mason")
mason.setup({
   ui = {
     icons = {
       package_installed = "✓",
       package_pending = "➜",
       package_uninstalled = "✗"

     }
   }
 })

local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({ function(server_name)
  local opts = {}
  opts.on_attach = function(_, bufnr)
     local bufopts = { silent = true, buffer = bufnr }
     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
     vim.keymap.set('n', 'gtD', vim.lsp.buf.type_definition, bufopts)
     vim.keymap.set('n', 'grf', vim.lsp.buf.references, bufopts)
     vim.keymap.set('n', '<space>p', vim.lsp.buf.format, bufopts)
  end
    nvim_lsp[server_name].setup(opts)
end })
