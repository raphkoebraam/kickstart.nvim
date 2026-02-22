return { -- Formatter Plugin
  {
    "git@github.com:mbbill/undotree.git",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
}
