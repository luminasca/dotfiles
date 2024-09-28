local M = {}

function M.load_keymaps(m)
  local keymaps = vim.api.nvim_set_keymap
  local default_opts = { noremap = true, silent = true }

  for scope, modes in pairs(m) do
    for mode, maps in pairs(modes) do
      for lhs, rhs in pairs(maps) do
        local opts = vim.tbl_extend("force", default_opts, { desc = rhs[2] })
        keymaps(mode, lhs, rhs[1], opts)
      end
    end
  end
end

return M
