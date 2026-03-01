-- Native LuaSnip snippets for Swift
-- No tab/space issues, full Lua power

local ls      = require("luasnip")
local snippet = ls.snippet
local text    = ls.text_node
local insert  = ls.insert_node

ls.add_snippets("swift", {

  -- pub → public
  snippet({ trig = "pub", dscr = "public access control" }, {
    text("public "), insert(0),
  }),

  -- priv → private
  snippet({ trig = "priv", dscr = "private access control" }, {
    text("private "), insert(0),
  }),

  -- if → if statement
  snippet({ trig = "if", dscr = "if statement" }, {
    text("if "), insert(1), text({ " {" }),
    text({ "", "\t" }), insert(2),
    text({ "", "}" }),
    insert(0),
  }),

  -- ife → if else statement
  snippet({ trig = "ife", dscr = "if else statement" }, {
    text("if "), insert(1), text({ " {" }),
    text({ "", "\t" }), insert(2),
    text({ "", "} else {", }),
    text({ "", "\t" }), insert(3),
    text({ "", "}" }),
    insert(0),
  }),

  -- ifl → if let
  snippet({ trig = "ifl", dscr = "if let" }, {
    text("if let "), insert(1), text(" = "), insert(2), text({ " {" }),
    text({ "", "\t" }), insert(3),
    text({ "", "}" }),
    insert(0),
  }),

  -- ifcl → if case let
  snippet({ trig = "ifcl", dscr = "if case let" }, {
    text("if case let "), insert(1), text(" = "), insert(2), text({ " {" }),
    text({ "", "\t" }), insert(3),
    text({ "", "}" }),
    insert(0),
  }),

  -- func → function declaration
  snippet({ trig = "func", dscr = "function declaration" }, {
    text("func "), insert(1, "name"), text("("), insert(2), text(")"),
    insert(3, " "),
    text({ "{", "\t" }),
    insert(0),
    text({ "", "}" }),
  }),

  -- funca → async function declaration
  snippet({ trig = "funca", dscr = "async function declaration" }, {
    text("func "), insert(1, "name"), text("("), insert(2), text(") async"),
    insert(3, " "),
    text({ "{", "\t" }),
    insert(0),
    text({ "", "}" }),
  }),

  -- g → guard statement
  snippet({ trig = "g", dscr = "guard statement" }, {
    text("guard "), insert(1), text({ " else {" }),
    text({ "", "\t" }), insert(2), text({ "" }),
    text({ "", "}" }),
    insert(0),
  }),

  -- gl → guard let
  snippet({ trig = "gl", dscr = "guard let" }, {
    text("guard let "), insert(1), text({ " else {" }),
    text({ "", "\t" }), insert(2),
    text({ "", "}" }),
    insert(0),
  }),

  -- gcl → if case let
  snippet({ trig = "gcl", dscr = "guard case let" }, {
    text("guard case let "), insert(1), text(" = "), insert(2), text({ " else {" }),
    text({ "", "\t" }), insert(3),
    text({ "", "}" }),
    insert(0),
  }),

  -- main → @main entry point
  snippet({ trig = "main", dscr = "@main entry point" }, {
    text("@main public struct "), insert(1, "App"), text({ " {", "\t" }),
    text("public static func main() {"), text({ "", "\t\t" }),
    insert(2),
    text({ "", "\t}" }),
    text({ "", "}" }), insert(0),
  }),

})
