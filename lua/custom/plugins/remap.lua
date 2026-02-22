return {
  -- ESC
  vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true }),

  vim.keymap.set('n', '<leader>pv', vim.cmd.Ex),
}
