return { -- Swift + ObjC Treesitter Support
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  opts = function(_, opts)
    opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
      "swift",
      "objc",
      "cpp",
      "c",
      "json",
      "xml",
    })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- Swift parser (custom URL)
    parser_config.swift = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-swift",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
      },
      filetype = "swift",
    }

    -- Objective-C parser
    parser_config.objc = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-objc",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "objc",
    }

    -- Filetype associations
    vim.filetype.add {
      extension = {
        m = "objc",
        mm = "cpp",   -- objc++ maps to cpp parser for better support
        swift = "swift",
        plist = "xml", -- plist is XML
      },
    }
  end,
}
