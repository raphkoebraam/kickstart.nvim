return { -- Code completion
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup {
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- Tab accepts the top item immediately (Xcode behavior)
          ["<Tab>"] = cmp.mapping(function(original)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              original()
            end
          end, { "i", "s" }),

          -- Enter also confirms when you've navigated to a specific item
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Navigate menu
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

          -- Jump through snippet fields with C-l / C-h
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.jumpable(1) then luasnip.jump(1) end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.jumpable(-1) then luasnip.jump(-1) end
          end, { "i", "s" }),

          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<C-d>"]     = cmp.mapping.scroll_docs(4),
          ["<C-u>"]     = cmp.mapping.scroll_docs(-4),
        }),
      }
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true
  },
  {
    "hrsh7th/cmp-path",
    lazy = true
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = true
  },
}
