-- All themes + live switcher via <leader>ft

return {

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = { theme = "wave" },
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = { flavour = "mocha" },
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = { contrast = "hard" },
  },

  -- {
  --   "sainnhe/everforest",
  --   lazy = true,
  -- },

  {
    "sainnhe/everforest",
    lazy = true,
    config = function()
      -- Pull Railscasts palette
      local r = {
        keyword      = "#CC7832",
        string       = "#95B946",
        number       = "#95B946",
        comment      = "#8E7042",
        type         = "#569E67",
        type_sys     = "#DA4938",
        decl_type    = "#5CD7FE",
        decl_other   = "#41A1BF",
        func         = "#5688B2",
        variable     = "#B2B0EB",
        macro        = "#F6F492",
        preprocessor = "#FFC56C",
        attribute    = "#5688B2",
      }

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "everforest",
        callback = function()
          local hi = function(group, opts)
            vim.api.nvim_set_hl(0, group, opts)
          end

          hi("@lsp.type.class.swift",                  { fg = "#5688B2" })
          hi("@lsp.type.macro.swift",                  { fg = "#5688B2" })
          hi("@lsp.type.modifier.swift",               { fg = "#5688B2" })
          hi("@lsp.mod.defaultLibrary.swift",          { link = "@lsp" })
          hi("@lsp.typemod.class.defaultLibrary.swift",{ fg = "#5688B2" })
          hi("@lsp.typemod.macro.defaultLibrary.swift",{ fg = "#5688B2" })
        end,
      })
    end,
  },

  {
    "railscasts",
    lazy = true,
    dir = vim.fn.stdpath("config") .. "/lua/custom/themes",
  },

  -- ── Active theme (change this line to switch default) ─────────────────────
  {
    "rebelot/kanagawa.nvim",       -- ← change to whichever you want as default
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({ theme = "wave" })
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- ── Theme switcher via <leader>ft ─────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    optional = true, -- only adds the keymap if telescope is already in your config
    keys = {
      {
        "<leader>ft",
        function()
          local themes = {
            -- { label, colorscheme command }
            { "railscasts",       "railscasts" },
            { "kanagawa (wave)",    "kanagawa-wave" },
            { "kanagawa (dragon)",  "kanagawa-dragon" },
            { "kanagawa (lotus)",   "kanagawa-lotus" },
            { "nightfox",          "nightfox" },
            { "carbonfox",         "carbonfox" },
            { "nordfox",           "nordfox" },
            { "terafox",           "terafox" },
            { "duskfox",           "duskfox" },
            { "tokyonight (night)","tokyonight-night" },
            { "tokyonight (storm)","tokyonight-storm" },
            { "catppuccin (mocha)","catppuccin-mocha" },
            { "gruvbox",           "gruvbox" },
            { "everforest",        "everforest" },
          }

          local pickers    = require("telescope.pickers")
          local finders    = require("telescope.finders")
          local conf       = require("telescope.config").values
          local actions    = require("telescope.actions")
          local action_state = require("telescope.actions.state")

          pickers.new({}, {
            prompt_title = "Themes",
            finder = finders.new_table {
              results = themes,
              entry_maker = function(entry)
                return {
                  value   = entry[2],
                  display = entry[1],
                  ordinal = entry[1],
                }
              end,
            },
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr)
              -- Live preview as you navigate
              local function preview()
                local selection = action_state.get_selected_entry()
                if selection then
                  pcall(vim.cmd, "colorscheme " .. selection.value)
                end
              end

              -- Hook into selection movement for live preview
              local actions_state = require("telescope.actions.state")
              vim.api.nvim_create_autocmd("CursorMoved", {
                buffer = prompt_bufnr,
                callback = preview,
              })

              actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                if selection then
                  pcall(vim.cmd, "colorscheme " .. selection.value)
                  vim.notify("Theme: " .. selection.display, vim.log.levels.INFO)
                end
              end)

              -- Restore original theme on cancel
              local original = vim.g.colors_name
              actions.close:enhance {
                pre = function()
                  -- only restore if user pressed <Esc>, not <CR>
                end,
              }

              return true
            end,
          }):find()
        end,
        desc = "Switch theme",
      },
    },
  },
}
