return { -- SourceKit LSP
  {
    "neovim/nvim-lspconfig",
    config = function()

      -- New API: vim.lsp.config instead of require('lspconfig')
      vim.lsp.config("sourcekit", {
        cmd = {
          vim.fn.trim(vim.fn.system("xcrun --find sourcekit-lsp")),
        },
        filetypes = { "swift", "objc", "objcpp" },
        root_markers = {
          ".xcworkspace",
          ".xcodeproj",
          "Package.swift",
          ".git",
        },
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
        settings = {
          sourcekit = {
            completion = {
              postfix = true,
            },
          },
        },
      })

      -- Enable it
      vim.lsp.enable("sourcekit")

      -- Keymaps on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP Actions",
        callback = function(args)
          local opts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set("n", "K",           vim.lsp.buf.hover,          opts)
          vim.keymap.set("n", "gd",          vim.lsp.buf.definition,     opts)
          vim.keymap.set("n", "gD",          vim.lsp.buf.declaration,    opts)
          vim.keymap.set("n", "gr",          vim.lsp.buf.references,     opts)
          vim.keymap.set("n", "gi",          vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>rn",  vim.lsp.buf.rename,         opts)
          vim.keymap.set("n", "<leader>ca",  vim.lsp.buf.code_action,    opts)
        end,
      })
    end,
  },
}
