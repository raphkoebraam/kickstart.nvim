-- ============================================================================
-- Railscasts — Neovim colorscheme
-- Ported from Xcode Railscasts.xccolortheme
-- ============================================================================
-- Usage:
--   Place in ~/.config/nvim/colors/railscasts.lua
--   Then:  :colorscheme railscasts
-- ============================================================================

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "railscasts"
vim.o.background = "dark"

local c = {
  -- Editor chrome
  bg            = "#1d1d1d",
  bg_light      = "#252525",  -- slightly lighter bg for floats/popups
  cursorline    = "#2d2f36",
  selection      = "#59647e",
  cursor        = "#ffffff",
  invisibles    = "#7f7f7f",
  line_nr       = "#5a5a5a",
  line_nr_cur   = "#e6e1db",

  -- Foreground / plain text
  fg            = "#e6e1db",

  -- Syntax
  comment       = "#8e7042",
  keyword       = "#cc7832",  -- orange – keywords, control flow
  string        = "#95b946",  -- green – strings, characters, numbers, regex
  number        = "#95b946",
  preproc       = "#ffc56c",  -- light orange – preprocessor
  attribute     = "#5688b2",  -- steel blue – attributes, functions
  func          = "#5688b2",
  decl_other    = "#41a1bf",  -- teal – other declarations (let, var, func keyword)
  decl_type     = "#5cd7fe",  -- cyan – type declarations (class, struct, enum)
  type          = "#569e67",  -- green – user types / classes
  type_sys      = "#da4938",  -- red – system types / built-in types
  variable      = "#b2b0eb",  -- lavender – variables
  property      = "#89b5d4",  -- lighter steel blue – properties
  enum_member   = "#c75a4a",  -- softer red – enum cases (distinct from system type red)
  macro         = "#f6f492",  -- yellow – macros, URLs
  url           = "#f6f492",
  mark          = "#91a1b1",  -- blue-grey – MARK/TODO

  -- Diagnostics
  error         = "#f64949",
  warning       = "#efb659",
  info          = "#5cd7fe",
  hint          = "#569e67",

  -- Diff
  diff_add      = "#2a3d2a",
  diff_change   = "#2d3040",
  diff_delete   = "#3d2a2a",
  diff_text     = "#3d3d5c",

  -- UI extras
  border        = "#3a3a3a",
  pmenu_bg      = "#252525",
  pmenu_sel     = "#59647e",
  match_paren   = "#ffc56c",

  none          = "NONE",
}

-- Helper ----------------------------------------------------------------
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI =============================================================
hi("Normal",            { fg = c.fg,          bg = c.bg })
hi("NormalFloat",       { fg = c.fg,          bg = c.bg_light })
hi("NormalNC",          { fg = c.fg,          bg = c.bg })
hi("Cursor",            { fg = c.bg,          bg = c.cursor })
hi("CursorLine",        { bg = c.cursorline })
hi("CursorColumn",      { bg = c.cursorline })
hi("ColorColumn",       { bg = c.cursorline })
hi("Visual",            { bg = c.selection })
hi("VisualNOS",         { bg = c.selection })
hi("Search",            { fg = c.bg,          bg = c.macro })
hi("IncSearch",         { fg = c.bg,          bg = c.preproc })
hi("CurSearch",         { fg = c.bg,          bg = c.preproc })
hi("Substitute",        { fg = c.bg,          bg = c.error })

hi("LineNr",            { fg = c.line_nr })
hi("CursorLineNr",     { fg = c.line_nr_cur, bold = true })
hi("SignColumn",        { fg = c.line_nr,     bg = c.bg })
hi("FoldColumn",        { fg = c.line_nr,     bg = c.bg })
hi("Folded",            { fg = c.comment,     bg = c.bg_light })
hi("VertSplit",         { fg = c.border })
hi("WinSeparator",      { fg = c.border })

hi("StatusLine",        { fg = c.fg,          bg = c.bg_light })
hi("StatusLineNC",      { fg = c.invisibles,  bg = c.bg_light })
hi("TabLine",           { fg = c.invisibles,  bg = c.bg_light })
hi("TabLineSel",        { fg = c.fg,          bg = c.bg,        bold = true })
hi("TabLineFill",       { bg = c.bg_light })
hi("WinBar",            { fg = c.fg,          bg = c.bg,        bold = true })
hi("WinBarNC",          { fg = c.invisibles,  bg = c.bg })

hi("Pmenu",             { fg = c.fg,          bg = c.pmenu_bg })
hi("PmenuSel",          { fg = c.fg,          bg = c.pmenu_sel })
hi("PmenuSbar",         { bg = c.bg_light })
hi("PmenuThumb",        { bg = c.invisibles })

hi("MatchParen",        { fg = c.match_paren, bold = true, underline = true })
hi("NonText",           { fg = c.invisibles })
hi("SpecialKey",        { fg = c.invisibles })
hi("Whitespace",        { fg = c.invisibles })
hi("EndOfBuffer",       { fg = c.line_nr })
hi("Directory",         { fg = c.attribute })
hi("Title",             { fg = c.preproc,     bold = true })
hi("Question",          { fg = c.string })
hi("MoreMsg",           { fg = c.string })
hi("ModeMsg",           { fg = c.fg,          bold = true })
hi("ErrorMsg",          { fg = c.error,       bold = true })
hi("WarningMsg",        { fg = c.warning })
hi("WildMenu",          { fg = c.bg,          bg = c.macro })
hi("FloatBorder",       { fg = c.border,      bg = c.bg_light })
hi("FloatTitle",        { fg = c.preproc,     bg = c.bg_light, bold = true })

-- Diff ==================================================================
hi("DiffAdd",           { bg = c.diff_add })
hi("DiffChange",        { bg = c.diff_change })
hi("DiffDelete",        { fg = c.error,       bg = c.diff_delete })
hi("DiffText",          { bg = c.diff_text })

-- Spell =================================================================
hi("SpellBad",          { sp = c.error,       undercurl = true })
hi("SpellCap",          { sp = c.warning,     undercurl = true })
hi("SpellRare",         { sp = c.info,        undercurl = true })
hi("SpellLocal",        { sp = c.hint,        undercurl = true })

-- Standard syntax (Vim legacy groups) ====================================
hi("Comment",           { fg = c.comment,     italic = true })

hi("Constant",          { fg = c.string })
hi("String",            { fg = c.string })
hi("Character",         { fg = c.string })
hi("Number",            { fg = c.number })
hi("Boolean",           { fg = c.number })
hi("Float",             { fg = c.number })

hi("Identifier",        { fg = c.variable })
hi("Function",          { fg = c.func })

hi("Statement",         { fg = c.keyword })
hi("Conditional",       { fg = c.keyword })
hi("Repeat",            { fg = c.keyword })
hi("Label",             { fg = c.keyword })
hi("Operator",          { fg = c.fg })
hi("Keyword",           { fg = c.keyword })
hi("Exception",         { fg = c.keyword })

hi("PreProc",           { fg = c.preproc })
hi("Include",           { fg = c.preproc })
hi("Define",            { fg = c.preproc })
hi("Macro",             { fg = c.macro })
hi("PreCondit",         { fg = c.preproc })

hi("Type",              { fg = c.type })
hi("StorageClass",      { fg = c.keyword })
hi("Structure",         { fg = c.decl_type })
hi("Typedef",           { fg = c.type })

hi("Special",           { fg = c.preproc })
hi("SpecialChar",       { fg = c.preproc })
hi("Tag",               { fg = c.keyword })
hi("Delimiter",         { fg = c.fg })
hi("SpecialComment",    { fg = c.mark,        italic = true })
hi("Debug",             { fg = c.error })

hi("Underlined",        { fg = c.url,         underline = true })
hi("Ignore",            { fg = c.invisibles })
hi("Error",             { fg = c.error,       bold = true })
hi("Todo",              { fg = c.macro,       bold = true })

-- Diagnostics ===========================================================
hi("DiagnosticError",           { fg = c.error })
hi("DiagnosticWarn",            { fg = c.warning })
hi("DiagnosticInfo",            { fg = c.info })
hi("DiagnosticHint",            { fg = c.hint })
hi("DiagnosticUnderlineError",  { sp = c.error,   undercurl = true })
hi("DiagnosticUnderlineWarn",   { sp = c.warning, undercurl = true })
hi("DiagnosticUnderlineInfo",   { sp = c.info,    undercurl = true })
hi("DiagnosticUnderlineHint",   { sp = c.hint,    undercurl = true })
hi("DiagnosticVirtualTextError",{ fg = c.error,   bg = "#2d1b1b" })
hi("DiagnosticVirtualTextWarn", { fg = c.warning, bg = "#2d2617" })
hi("DiagnosticVirtualTextInfo", { fg = c.info,    bg = "#1b2630" })
hi("DiagnosticVirtualTextHint", { fg = c.hint,    bg = "#1b2d1f" })

-- Treesitter ============================================================
-- Identifiers
hi("@variable",                 { fg = c.variable })
hi("@variable.builtin",         { fg = c.variable })
hi("@variable.parameter",       { fg = c.variable })
hi("@variable.member",          { fg = c.variable })
hi("@constant",                 { fg = c.enum_member })
hi("@constant.builtin",         { fg = c.type_sys })
hi("@constant.macro",           { fg = c.macro })
hi("@module",                   { fg = c.fg,       bold = true })
hi("@label",                    { fg = c.mark })

-- Literals
hi("@string",                   { fg = c.string })
hi("@string.escape",            { fg = c.preproc })
hi("@string.special",           { fg = c.preproc })
hi("@string.special.url",       { fg = c.url,       underline = true })
hi("@character",                { fg = c.string })
hi("@number",                   { fg = c.number })
hi("@number.float",             { fg = c.number })
hi("@boolean",                  { fg = c.number })

-- Types
hi("@type",                     { fg = c.type,      bold = true })
hi("@type.builtin",             { fg = c.type_sys,  bold = true })
hi("@type.definition",          { fg = c.decl_type, bold = true })
hi("@attribute",                { fg = c.type_sys,  bold = true })
hi("@attribute.builtin",        { fg = c.type_sys,  bold = true })
hi("@property",                 { fg = c.variable })

-- Functions
hi("@function",                 { fg = c.func })
hi("@function.builtin",         { fg = c.func })
hi("@function.call",            { fg = c.func })
hi("@function.macro",           { fg = c.macro })
hi("@function.method",          { fg = c.func })
hi("@function.method.call",     { fg = c.func })
hi("@constructor",              { fg = c.type })

-- Keywords
hi("@keyword",                  { fg = c.keyword })
hi("@keyword.coroutine",        { fg = c.keyword })
hi("@keyword.function",         { fg = c.decl_other })
hi("@keyword.operator",         { fg = c.keyword })
hi("@keyword.import",           { fg = c.preproc })
hi("@keyword.type",             { fg = c.decl_type })
hi("@keyword.modifier",         { fg = c.keyword })
hi("@keyword.repeat",           { fg = c.keyword })
hi("@keyword.return",           { fg = c.keyword })
hi("@keyword.debug",            { fg = c.error })
hi("@keyword.exception",        { fg = c.keyword })
hi("@keyword.conditional",      { fg = c.keyword })
hi("@keyword.directive",        { fg = c.preproc })

-- Punctuation & operators
hi("@punctuation.bracket",      { fg = c.fg })
hi("@punctuation.delimiter",    { fg = c.fg })
hi("@punctuation.special",      { fg = c.preproc })
hi("@operator",                 { fg = c.fg })

-- Comments
hi("@comment",                  { fg = c.comment,  italic = true })
hi("@comment.documentation",    { fg = c.comment,  italic = true })
hi("@comment.todo",             { fg = c.macro,    bold = true })
hi("@comment.note",             { fg = c.info,     bold = true })
hi("@comment.warning",          { fg = c.warning,  bold = true })
hi("@comment.error",            { fg = c.error,    bold = true })

-- Markup
hi("@markup.heading",           { fg = c.preproc,  bold = true })
hi("@markup.strong",            { bold = true })
hi("@markup.italic",            { italic = true })
hi("@markup.strikethrough",     { strikethrough = true })
hi("@markup.underline",         { underline = true })
hi("@markup.link",              { fg = c.url,      underline = true })
hi("@markup.link.url",          { fg = c.url,      underline = true })
hi("@markup.raw",               { fg = c.string })
hi("@markup.list",              { fg = c.keyword })

-- Tags (HTML/XML)
hi("@tag",                      { fg = c.keyword })
hi("@tag.attribute",            { fg = c.attribute })
hi("@tag.delimiter",            { fg = c.fg })

-- LSP semantic tokens ===================================================
hi("@lsp.type.class",           { fg = c.type,     bold = true })
hi("@lsp.type.struct",          { fg = c.type,     bold = true })
hi("@lsp.type.enum",            { fg = c.type,     bold = true })
hi("@lsp.type.interface",       { fg = c.type,     bold = true })
hi("@lsp.type.typeAlias",       { fg = c.type,     bold = true })
hi("@lsp.type.parameter",       { fg = c.variable })
hi("@lsp.type.variable",        { fg = c.variable })
hi("@lsp.type.property",        { fg = c.variable })
hi("@lsp.type.function",        { fg = c.func })
hi("@lsp.type.method",          { fg = c.func })
hi("@lsp.type.macro",           { fg = c.macro })
hi("@lsp.type.namespace",       { fg = c.type })
hi("@lsp.type.enumMember",      { fg = c.enum_member })
hi("@lsp.type.keyword",         { fg = c.keyword })
hi("@lsp.type.comment",         { fg = c.comment,  italic = true })
hi("@lsp.mod.declaration",      {})
hi("@lsp.mod.defaultLibrary",   { fg = c.type_sys })
-- Bold specifically for type-name declarations
hi("@lsp.typemod.class.declaration",     { fg = c.type, bold = true })
hi("@lsp.typemod.struct.declaration",    { fg = c.type, bold = true })
hi("@lsp.typemod.enum.declaration",      { fg = c.type, bold = true })
hi("@lsp.typemod.interface.declaration", { fg = c.type, bold = true })
hi("@lsp.typemod.typeAlias.declaration", { fg = c.type, bold = true })
hi("@lsp.typemod.class.defaultLibrary",    { fg = c.type_sys, bold = true })
hi("@lsp.typemod.struct.defaultLibrary",   { fg = c.type_sys, bold = true })
hi("@lsp.typemod.enum.defaultLibrary",     { fg = c.type_sys, bold = true })
hi("@lsp.typemod.function.defaultLibrary", { fg = c.func })
hi("@lsp.typemod.variable.defaultLibrary", { fg = c.variable })

-- Swift-specific LSP overrides (SourceKit-LSP) ==========================
hi("@lsp.type.class.swift",                    { fg = c.attribute, bold = true })
hi("@lsp.type.macro.swift",                    { fg = c.preproc })          -- #if/#endif (gold)
hi("@lsp.type.modifier.swift",                 { fg = c.type_sys,  bold = true })
hi("@lsp.type.identifier.swift",               {})                          -- fallthrough to syntax
hi("@lsp.type.function.swift",                 { fg = c.func })
hi("@lsp.type.method.swift",                   { fg = c.func })
hi("@lsp.type.property.swift",                 { fg = c.variable })
hi("@lsp.type.keyword.swift",                  { fg = c.keyword })
hi("@lsp.typemod.keyword.declaration.swift",   { fg = c.keyword })
hi("@lsp.type.operator.swift",                 { fg = c.fg })

-- Swift syntax layer overrides
hi("swiftVarName",                             { fg = c.variable })          -- bare variables = lavender
hi("swiftImportModule",                        { fg = c.fg, bold = true })   -- import targets = white bold
hi("swiftTypeDeclaration",                     { fg = c.fg })                -- -> : ? = white (punctuation)
hi("swiftOperator",                            { fg = c.fg })                -- = + - etc. = white
hi("swiftPreprocessor",                        { fg = c.preproc })
hi("swiftPreproc",                             { fg = c.preproc })           -- swiftPreproc links to PreCondit
hi("swiftConditionKeyword",                    { fg = c.preproc })
hi("swiftPoundDirective",                      { fg = c.preproc })
hi("swiftCompilerDirective",                   { fg = c.preproc })
hi("swiftType",                                { fg = c.type })              -- type references = green
hi("PreCondit",                                { fg = c.preproc })           -- #if/#endif fallback

hi("@lsp.mod.defaultLibrary.swift",            { link = "@lsp" })
hi("@lsp.typemod.class.defaultLibrary.swift",  { fg = c.type_sys,  bold = true })  -- system types
hi("@lsp.typemod.macro.defaultLibrary.swift",  { fg = c.type_sys,  bold = true })  -- @MainActor/@Observable (pri 127 wins over macro.swift pri 125)

-- Git signs =============================================================
hi("GitSignsAdd",       { fg = c.string })
hi("GitSignsChange",    { fg = c.warning })
hi("GitSignsDelete",    { fg = c.error })

-- Telescope =============================================================
hi("TelescopeNormal",       { fg = c.fg,        bg = c.bg_light })
hi("TelescopeBorder",       { fg = c.border,    bg = c.bg_light })
hi("TelescopeTitle",        { fg = c.preproc,   bold = true })
hi("TelescopeMatching",     { fg = c.macro,     bold = true })
hi("TelescopeSelection",    { bg = c.cursorline })
hi("TelescopePromptPrefix", { fg = c.keyword })

-- nvim-cmp ==============================================================
hi("CmpItemAbbr",              { fg = c.fg })
hi("CmpItemAbbrMatch",         { fg = c.macro,   bold = true })
hi("CmpItemAbbrMatchFuzzy",    { fg = c.macro,   bold = true })
hi("CmpItemAbbrDeprecated",    { fg = c.invisibles, strikethrough = true })
hi("CmpItemKindFunction",      { fg = c.func })
hi("CmpItemKindMethod",        { fg = c.func })
hi("CmpItemKindVariable",      { fg = c.variable })
hi("CmpItemKindClass",         { fg = c.type })
hi("CmpItemKindStruct",        { fg = c.type })
hi("CmpItemKindKeyword",       { fg = c.keyword })
hi("CmpItemKindProperty",      { fg = c.fg })
hi("CmpItemKindText",          { fg = c.fg })
hi("CmpItemKindModule",        { fg = c.type })
hi("CmpItemKindSnippet",       { fg = c.preproc })
hi("CmpItemKindConstant",      { fg = c.type })
hi("CmpItemKindEnum",          { fg = c.type })
hi("CmpItemKindEnumMember",    { fg = c.type })
hi("CmpItemKindInterface",     { fg = c.type })

-- Indent Blankline ======================================================
hi("IblIndent",         { fg = "#2a2a2a" })
hi("IblScope",          { fg = c.border })

-- Lazy / Mason ==========================================================
hi("LazyButton",        { fg = c.fg,        bg = c.bg_light })
hi("LazyButtonActive",  { fg = c.bg,        bg = c.keyword })
hi("LazyH1",            { fg = c.bg,        bg = c.keyword,  bold = true })

-- Notify ================================================================
hi("NotifyERRORBorder", { fg = c.error })
hi("NotifyWARNBorder",  { fg = c.warning })
hi("NotifyINFOBorder",  { fg = c.info })
hi("NotifyERRORTitle",  { fg = c.error })
hi("NotifyWARNTitle",   { fg = c.warning })
hi("NotifyINFOTitle",   { fg = c.info })

-- Mini.* (statusline, etc.) =============================================
hi("MiniStatuslineFilename",    { fg = c.fg,      bg = c.bg_light })
hi("MiniStatuslineDevinfo",     { fg = c.fg,      bg = c.cursorline })
hi("MiniStatuslineModeNormal",  { fg = c.bg,      bg = c.attribute,  bold = true })
hi("MiniStatuslineModeInsert",  { fg = c.bg,      bg = c.string,     bold = true })
hi("MiniStatuslineModeVisual",  { fg = c.bg,      bg = c.macro,      bold = true })
hi("MiniStatuslineModeReplace", { fg = c.bg,      bg = c.error,      bold = true })
hi("MiniStatuslineModeCommand", { fg = c.bg,      bg = c.preproc,    bold = true })
