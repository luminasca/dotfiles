let g:lsp_settings = {
  \  'pylsp-all': {
  \    'workspace_config': {
  \      'pylsp': {
  \        'configurationSources': ['flake8'],
  \        'plugins': {
  \          'flake8': {
  \            'enabled': 1
  \          },
  \          'mccabe': {
  \            'enabled': 0
  \          },
  \          'pycodestyle': {
  \            'enabled': 0
  \          },
  \          'pyflakes': {
  \            'enabled': 0
  \          },
  \        }
  \      }
  \    }
  \  }
  \}
