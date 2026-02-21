return { -- Formatter Plugin
  {
    "git@github.com:stevearc/conform.nvim.git",
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },
}
