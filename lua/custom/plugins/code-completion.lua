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
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup {
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- Confirm selection
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Super-tab forward: select completion → expand/jump snippet → fallback
          ["<Tab>"] = cmp.mapping(function(original)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              original()
            end
          end, { "i", "s" }),

          -- Super-tab backward
          ["<S-Tab>"] = cmp.mapping(function(original)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              original()
            end
          end, { "i", "s" }),

          -- Scroll docs in hover float
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),

          -- Manually trigger completion
          ["<C-Space>"] = cmp.mapping.complete(),
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
