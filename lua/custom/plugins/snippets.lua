return { -- Snippets
  {
    "L3MON4D3/LuaSnip",
    lazy = true, -- loaded as a dependency of nvim-cmp
    config = function()
      local luasnip = require("luasnip")
      luasnip.setup()

      -- Load SnipMate-format snippets from ./snippets/ in your config dir
      require("luasnip.loaders.from_snipmate").load({
        paths = vim.fn.stdpath("config") .. "/lua/custom/snippets",
      })
    end,
  },
}
