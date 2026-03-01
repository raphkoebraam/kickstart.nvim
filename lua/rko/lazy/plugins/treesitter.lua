return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
  config = function()
    local filetypes = {
      "bash",
      "c",
      "cpp",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "swift",
      "objc",
      "json",
      "xml",
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if not ok then
          -- Parser not installed yet; silently skip
        end
      end,
    })

    local parser_config = require("nvim-treesitter.parsers")

    -- Swift parser (custom URL)
    parser_config.swift = {
      install_info = {
        url = "https://github.com/alex-pinkus/tree-sitter-swift",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
      },
      filetype = "swift",
    }
    vim.treesitter.language.register("swift", "swift")

    -- Objective-C parser
    parser_config.objc = {
      install_info = {
        url = "https://github.com/tree-sitter-grammars/tree-sitter-objc",
        files = { "src/parser.c" },
        branch = "master",
      },
      filetype = "objc",
    }
    vim.treesitter.language.register("objc", "objc")

    require("nvim-treesitter").install(
      filetypes,
      {
        skip = {
          installed = true
        }
      })

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
