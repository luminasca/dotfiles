require'lspconfig'.pylsp.setup{
        cmd = { "pylsp" }
        filetypes = { "python" }
        root_dir = function(fname)
                local root_files = {
                        'pyproject.toml',
                        'setup.py',
                        'setup.cfg',
                        'requirements.txt',
                        'Pipfile',
                }
                return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
        end,
        single_file_support = true
}

require'lspconfig'.bashls.setup{
        Default Values:
        cmd = { "bash-language-server", "start" }
        cmd_env = {
                GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
        }
        filetypes = { "sh" }
        root_dir = util.find_git_ancestor
        single_file_support = true
}
