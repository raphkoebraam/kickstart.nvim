return { -- Snippets
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    config = function()
      local luasnip = require("luasnip")
      luasnip.setup()

      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/lua/custom/snippets",
      })
    end,
  },
}
