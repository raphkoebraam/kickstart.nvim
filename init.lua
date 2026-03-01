require("rko")

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Swift / ObjC: spaces over tabs, 4 wide
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "swift", "objc", "objcpp" },
  callback = function()
    vim.bo.expandtab  = true
    vim.bo.tabstop    = 4
    vim.bo.shiftwidth = 4
  end,
})
