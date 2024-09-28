local M = {}

M.general = {
  i = {},
  n = {
    ["<ESC>"] = { ":noh <CR>", "clear highlights" },

    ["<c-h>"] = { "<c-w>h", "move to left window" },
    ["<c-j>"] = { "<c-w>j", "move to bottom window" },
    ["<c-k>"] = { "<c-w>k", "move to top window" },
    ["<c-l>"] = { "<c-w>l", "move to right window" },

    ["<TAB>"] = { ":bnext <CR>", "next buffer" },
    ["<S-TAB>"] = { ":bprevious <CR>", "previous buffer" },
    ["<leader>x"] = { ":bd! <CR>", "close current buffer" },
    ["<leader>X"] = { ":bufdo bd! <CR>", "close all buffers" },

    -- Netrw: deprecated
    -- ["<C-n>"] = { ":Lexplore <CR>", "toggle netrw" },
  },
  v = {},
  t = {
    ["<C-x>"] = { "<C-\\><C-n>", "exit terminal mode" },
  },
}

return M
