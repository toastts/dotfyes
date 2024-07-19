-- SET UP FOR LAZY
-- Name:         flour
-- Description:  highly minimal, styling over coloring
-- Author:       toast <toastts@icloud.com>
-- Maintainer:   toast <toastts@icloud.com>
-- Website:      toasts.space
-- License:      MIT

-- MANIFESTO --
-- should use colors only for UI-related highlight groups
-- should only use combinations of bold, reverse, underline, italic, and NONE for syntax-related highlight groups
-- should work the same on light and dark background without human intervention

return {
  "tjdevries/colorbuddy.nvim",
  lazy = false,
  config = function()
    local colorbuddy = require('colorbuddy')

    local Color = colorbuddy.Color
    local c = colorbuddy.colors
    local Group = colorbuddy.Group
    local g = colorbuddy.groups
    local styles = colorbuddy.styles

    local b = styles.bold
    local i = styles.italic
    local n = styles.inverse
    local ul = styles.underline
    local r = styles.reverse
    local sto = styles.standout
    local no = styles.NONE
    local v = vim

    ------------------------
    -- COLORS USING RADIX --
    -- sandDark grayscale for fonts
    Color.new("sand1", "#161615") -- fg1, main text
    Color.new("sand2", "#1c1c1a")
    Color.new("sand3", "#232320")
    Color.new("sand4", "#282826")
    Color.new("sand5", "#2e2e2b") -- fg2
    Color.new("sand6", "#353431")
    Color.new("sand7", "#3e3e3a")
    Color.new("sand8", "#51504b")
    Color.new("sand9", "#717069")  -- fg3
    Color.new("sand10", "#7f7e77")
    Color.new("sand11", "#a1a09a") -- fg4
    Color.new("sand12", "#ededec")

    -- Amber for base UI background
    Color.new("amber1", "#fefdfb")
    Color.new("amber2", "#fff9ed") -- bg1
    Color.new("amber3", "#fff4d5") -- bg2 slight hl cursor/col
    Color.new("amber4", "#ffecbc") -- bg3
    Color.new("amber5", "#ffe3a2")
    Color.new("amber6", "#ffd386")
    Color.new("amber7", "#f3ba63")
    Color.new("amber8", "#ee9d2b")
    Color.new("amber9", "#ffb224")
    Color.new("amber10", "#ffa01c")
    Color.new("amber11", "#ad5700") -- low contrast text
    Color.new("amber12", "#4e2009") -- high contast text

    -- semantic colors for warnings, info, etc
    -- tomatoDark for errors
    Color.new("tomato1", "#1d1412")
    Color.new("tomato2", "#2a1410")
    Color.new("tomato3", "#3b1813")
    Color.new("tomato4", "#481a14")
    Color.new("tomato5", "#541c15")
    Color.new("tomato6", "#652016")
    Color.new("tomato7", "#7f2315")
    Color.new("tomato8", "#a42a12")
    Color.new("tomato9", "#e54d2e")
    Color.new("tomato10", "#ec5e41")
    Color.new("tomato11", "#f16a50") --red fg text
    Color.new("tomato12", "#feefec") -- red bg highlight

    -- grassDark for success or green
    Color.new("grass1", "#0d1912")
    Color.new("grass2", "#0f1e13")
    Color.new("grass3", "#132819")
    Color.new("grass4", "#16301d")
    Color.new("grass5", "#193921")
    Color.new("grass6", "#1d4427")
    Color.new("grass7", "#245530")
    Color.new("grass8", "#2f6e3b")
    Color.new("grass9", "#46a758")
    Color.new("grass10", "#55b467")
    Color.new("grass11", "#63c174") -- green fg text
    Color.new("grass12", "#e5fbeb") -- green bg highlight

    -- yellowDark for warning states
    Color.new("yellow1", "#1c1500")
    Color.new("yellow2", "#221a00")
    Color.new("yellow3", "#2c2100")
    Color.new("yellow4", "#352800")
    Color.new("yellow5", "#3e3000")
    Color.new("yellow6", "#493c00")
    Color.new("yellow7", "#594a05")
    Color.new("yellow8", "#705e00")
    Color.new("yellow9", "#f5d90a")
    Color.new("yellow10", "#ffef5c")
    Color.new("yellow11", "#f0c000")      -- yellow fg text
    Color.new("yellow12", "#fffad1")      -- yellow bg highlight

    Color.new("fg1", "#161615")           -- sand1 main text
    Color.new("fg2", "#2e2e2b")           -- sand5
    Color.new("fg3", "#717069")           -- sand9 subtle ui
    Color.new("fg4", "#a1a09a")           -- sand11 comments

    Color.new("bg1", "#fff9ed")           -- amber2 background
    Color.new("bg2", "#fff4d5")           -- amber3 subtle hl, cursor/col
    Color.new("bg3", "#ffecbc")           -- amber4
    Color.new("lcontrast", "#ad5700")  -- amber11
    Color.new("hcontrast", "#4e2009") -- amber12

    Color.new("yellow", "#f0c000")
    Color.new("yellow_bg", "#fffad1")

    Color.new("red", "#f16a50")      --red fg text
    Color.new("red_bg", "#feefec")   -- red bg highlight

    Color.new("green", "#63c174")    -- green fg text
    Color.new("green_bg", "#e5fbeb") -- green bg highlight

    ----------------------
    -- Vim Editor Color --       --FG--         --BG--    --STYLE--
    ----------------------
    Group.new("Normal",          c.fg1,         c.bg1,          no)

    Group.new("ColorColumn",     c.none,        c.bg2,          no)
    Group.new("Conceal",         c.none,        c.none,         no)
    Group.new("Cursor",          c.none,        c.none,         r)
    Group.new("CursorIM",        c.none,        c.none,         r)
    Group.new("CursorColumn",    c.none,        c.bg2,          no)
    Group.new("CursorLine",      c.none,        c.bg2,          no)
    Group.new("Directory",       c.none,        c.none,         b)
    Group.new("ErrorMsg",        c.red,         c.none,         no)
    Group.new("VertSplit",       c.fg1,         c.none,         b)
    Group.new("Folded",          c.fg2,         c.none,         no)
    Group.new("FoldColumn",      c.fg3,         c.none,         no)
    Group.new("IncSearch",       c.none,        c.green_bg,     no)
    Group.new("LineNr",          c.lcontrast,   c.none,         no)
    Group.new("CursorLineNr",    c.hcontrast,   c.none,         b)
    Group.new("MatchParen",      c.none,        c.bg2,          no)
    Group.new("Italic",          c.none,        c.none,         i)
    Group.new("ModeMsg",         c.none,        c.none,         no)
    Group.new("MoreMsg",         c.fg2,         c.none,         no)
    Group.new("NonText",         c.none,        c.none,         no)

    Group.new("PMenu",           c.fg2,         c.bg2,          no)
    Group.new("PMenuSel",        c.none,        c.bg2,          r)
    Group.new("PMenuSbar",       c.fg3,         c.fg3,          no)
    Group.new("PMenuThumb",      c.fg2,         c.fg2,          no)

    Group.new("Question",        c.none,        c.none,         no)
    Group.new("Search",          c.none,        c.bg3,          no)
    Group.new("SpecialKey",      c.none,        c.none,         no)
    Group.new("Whitespace",      c.none,        c.none,         no)
    Group.new("StatusLine",      c.none,        c.fg2,          r)
    Group.new("StatusLineNC",    c.none,        c.fg3,          no)

    -- Tablines aren't really configd
    -- Group.new("TabLine",         c.none,        c.none,         no)
    -- Group.new("TabLineFill",     c.none,        c.none,         no)
    -- Group.new("TabLineSel",      c.fg2,         c.none,         no)

    Group.new("Title",           c.none,        c.none,         no)
    Group.new("Visual",          c.none,        c.none,         r)
    Group.new("VisualNOS",       c.none,        c.none,         r)
    Group.new("WarningMsg",      c.yellow,      c.none,         no)

    Group.new("WildMenu",        c.fg2,         c.fg2,          no)
    Group.new("WinBar",          c.fg2,         c.none,         b)
    Group.new("WinBarNC",        c.fg2,         c.none,         no)
    Group.new("SignColumn",      c.none,        c.none,         no)
    Group.new("Special",         c.none,        c.none,         no)

    ---------------------------
    -- Vim Help Highlighting --
    ---------------------------
    Group.new("helpCommand",     c.none,        c.none,         no)
    Group.new("helpExample",     c.none,        c.none,         no)
    Group.new("helpHeader",      c.none,        c.none,         b)
    Group.new("helpSectionDelim",c.none,        c.none,         no)

    ----------------------------------
    -- Standard Syntax Highlighting --
    ----------------------------------
    Group.new("Comment",         c.fg3,         c.none,         no)

    Group.new("Constant",        c.fg2,         c.none,         no)
    Group.new("String",          g.Constant,    c.none,         i)
    Group.new("Character",       g.Constant,    c.none,         i)
    Group.new("Number",          g.Constant,    c.none,         no)
    Group.new("Boolean",         g.Constant,    c.none,         no)
    Group.new("Float",           g.Constant,    c.none,         no)

    Group.new("Statement",       c.fg3,         c.none,         b)

    Group.new("Identifier",      c.none,        c.none,         ul)
    Group.new("Function",        c.none,        c.none,         b)

    Group.new("PreProc",         c.fg3,         c.none,         no)

    Group.new("Type",            c.fg2,         c.none,         no)

    Group.new("Special",         c.fg2,         c.none,         no)
    Group.new("Debug",           c.fg2,         c.none,         no)

    Group.new("Underlined",      c.none,        c.none,         ul)
    Group.new("Ignore",          c.none,        c.none,         no)
    Group.new("Error",           c.red,         c.none,         ul)
    Group.new("Todo",            c.none,        c.none,         r)

    -----------------------------
    -- TreeSitter Highlighting --
    -----------------------------
    Group.new("TSBoolean",          g.Boolean,     g.Boolean,      g.Boolean)
    Group.new("TSCharacter",        g.Character,   g.Character,    g.Character)
    Group.new("TSCharacterSpecial", g.Special,     g.Special,      g.Special)
    Group.new("TSComment",          g.Comment,     g.Comment,      g.Comment)
    Group.new("TSConditional",      g.Statement,   g.Statement,    g.Statement)
    Group.new("TSConstant",         g.Identifier,  g.Identifier,   g.Identifier)
    Group.new("TSConstBuiltin",     g.Identifier,  g.Identifier,   g.Identifier)
    Group.new("TSConstMacro",       g.Identifier,  g.Identifier,   g.Identifier)
    Group.new("TSConstructor",      g.Function,    g.Function,     g.Function)
    Group.new("TSDebug",            g.Debug,       g.Debug,        g.Debug)
    Group.new("TSDefine",           g.PreProc,     g.PreProc,      g.PreProc)
    Group.new("TSError",            g.Error,       g.Error,        g.Error)
    Group.new("TSException",        g.Statement,   g.Statement,    g.Statement)
    Group.new("TSField",            g.Identifier,  g.Identifier,   g.Identifier)
    Group.new("TSFloat",            g.Float,       g.Float,        g.Float)
    Group.new("TSFunction",         g.Function,    g.Function,     g.Function)
    Group.new("TSFuncBuiltin",      g.Function,    g.Function,     g.Function)
    Group.new("TSFuncMacro",        g.Function,    g.Function,     g.Function)
    Group.new("TSInclude",          g.PreProc,     g.PreProc,      g.PreProc)
    Group.new("TSKeywordFunction",  g.Function,    g.Function,     g.Function)
    Group.new("TSKeywordOperator",  g.Statement,   g.Statement,    g.Statement)
    Group.new("TSKeywordReturn",    g.Statement,   g.Statement,    g.Statement)
    Group.new("TSLabel",            g.Statement,   g.Statement,    g.Statement)
    Group.new("TSMethod",           g.Function,    g.Function,     g.Function)
    Group.new("TSNamespace",        g.TSMethod,    g.TSMethod,     g.TSMethod)
    Group.new("TSNumber",           g.Number,      g.Number,       g.Number)
    Group.new("TSOperator",         g.Statement,   g.Statement,    g.Statement)
    Group.new("TSParameter",        g.Normal,      g.Normal,       g.Normal)
    Group.new("TSParameterReference",g.Normal,     g.Normal,       g.Normal)
    Group.new("TSPreProc",          g.PreProc,     g.PreProc,      g.PreProc)
    Group.new("TSProperty",         g.TSField,     g.TSField,      g.TSField)
    Group.new("TSPunctDelimiter",   g.Normal,      g.Normal,       g.Normal)
    Group.new("TSPunctBracket",     g.Normal,      g.Normal,       g.Normal)
    Group.new("TSRepeat",           g.Statement,   g.Statement,    g.Statement)
    Group.new("TSStorageClass",     g.Type,        g.Type,         g.Type)
    Group.new("TSString",           g.String,      g.String,       g.String)
    Group.new("TSStringRegex",      g.String,      g.String,       g.String)
    Group.new("TSStringEscape",     g.String,      g.String,       g.String)
    Group.new("TSSymbol",           g.Normal,      g.Normal,       g.Normal)
    Group.new("TSTag",              g.Normal,      g.Normal,       g.Normal)
    Group.new("TSTagAtribute",      g.Normal,      g.Normal,       g.Normal)
    Group.new("TSTagDelimiter",     g.Normal,      g.Normal,       g.Normal)
    Group.new("TSText",             g.Normal,      g.Normal,       g.Normal)
    Group.new("TSStrong",           c.none,        c.none,         b)
    Group.new("TSEmphasis",         c.none,        c.none,         i)
    Group.new("TSUnderline",        c.none,        c.none,         ul)
    Group.new("TSStrike",           c.none,        c.none,         ul)
    Group.new("TSTitle",            c.none,        c.none,         ul)
    Group.new("TSLiteral",          c.none,        c.none,         ul)
    Group.new("TSURI",              g.Underlined,  g.Underlined,   g.Underlined)
    Group.new("TSMath",             g.Normal,      g.Normal,       g.Normal)
    Group.new("TSEnvironment",      g.Normal,      g.Normal,       g.Normal)
    Group.new("TSEnvironmentName",  g.Identifier,  g.Identifier,   g.Identifier)
    Group.new("TSNote",             g.Normal,      g.Normal,       g.Normal)
    Group.new("TSWarning",          c.orange,      c.none,         no)
    Group.new("TSDanger",           c.red,         c.none,         no)
    Group.new("TSTodo",             g.Todo,        g.Todo,         g.Todo)
    Group.new("TSType",             g.Type,        g.Type,         g.Type)
    Group.new("TSTypeBuiltin",      g.Type,        g.Type,         g.Type)
    Group.new("TSTypeQualifier",    g.Type,        g.Type,         g.Type)
    Group.new("TSTypeDefinition",   g.Type,        g.Type,         g.Type)
    Group.new("TSVariable",         g.Identifier,  g.Identifier,   g.Identifier)
    Group.new("TSVariableBuiltin",  g.Identifier,  g.Identifier,   g.Identifier)

    -----------------------
    -- Diff Highlighting --
    -----------------------
    Group.new("DiffAdd",            c.none,        c.green_bg,     no)
    Group.new("DiffChange",         c.none,        c.yellow_bg,    no)
    Group.new("DiffDelete",         c.none,        c.red_bg,       no)

    -----------------------------
    --     LSP Highlighting    --
    -----------------------------
    Group.new("LspDiagnosticsDefaultError",          c.red,      c.none,         no)
    Group.new("LspDiagnosticsDefaultWarning",        c.yellow,   c.none,         no)
    Group.new("LspDiagnosticsDefaultInformation",    c.none,     c.none,         no)
    Group.new("LspDiagnosticsDefaultHint",           c.none,     c.none,         no)

    Group.new("LspDiagnosticsUnderlineError",        c.red,      c.none,         ul)
    Group.new("LspDiagnosticsUnderlineWarning",      c.yellow,   c.none,         ul)
    Group.new("LspDiagnosticsUnderlineInformation",  c.none,     c.none,         ul)
    Group.new("LspDiagnosticsUnderlineHint",         c.none,     c.none,         ul)

    Group.new("LspDiagnosticsFloatingError",         c.red,      c.none,       ul)
    Group.new("LspDiagnosticsFloatingWarning",       c.yellow,   c.none,    ul)
    Group.new("LspDiagnosticsFloatingInformation",   c.fg4,      c.none,    ul)
    Group.new("LspDiagnosticsFloatingHint",          c.fg4,      c.none,    ul)

    Group.new("LspDiagnosticsSignError",             c.red,      c.none,         no)
    Group.new("LspDiagnosticsSignWarning",           c.yellow,   c.none,         no)
    Group.new("LspDiagnosticsSignInformation",       c.fg3,      c.none,         no)
    Group.new("LspDiagnosticsSignHint",              c.yellow,   c.none,         no)

    Group.new("LspDiagnosticsVirtualTextError",      c.red,      c.none,         no)
    Group.new("LspDiagnosticsVirtualTextWarning",    c.yellow,   c.none,         no)
    Group.new("LspDiagnosticsVirtualTextInformation",c.none,     c.none,         no)
    Group.new("LspDiagnosticsVirtualTextHint",       c.none,     c.none,         no)

    ---------------------------
    -- LSP SAGA Highlighting --
    ---------------------------
    -- Group.new('', c.none, c.none, no)
    -- Group.new('', c.none, c.none, no)
    -- Group.new('', c.none, c.none, no)
    -- Group.new('', c.none, c.none, no)


    ---------------------------
    -- Gitsigns Highlighting --
    ---------------------------
    Group.new("GitSignsAdd",         c.green,       c.none,         b)
    Group.new("GitSignsChange",      c.yellow,      c.none,         b)
    Group.new("GitSignsDelete",      c.red,         c.none,         b)

    ---------------------------
    -- Filetype Highlighting --
    ---------------------------
    -- plugins can just steal what i already am using

    -- -- Asciidoc
    -- Group.new('asciidocListingBlock', c.mono_2, c.none, no)
    --
    -- -- C/C++ highlighting
    -- Group.new('cInclude',           c.hue_3, c.none,  no)
    -- Group.new('cPreCondit',         c.hue_3, c.none,  no)
    -- Group.new('cPreConditMatch',    c.hue_3, c.none,  no)
    -- Group.new('cType',              c.hue_3, c.none,  no)
    -- Group.new('cStorageClass',      c.hue_3, c.none,  no)
    -- Group.new('cStructure',         c.hue_3, c.none,  no)
    -- Group.new('cOperator',          c.hue_3, c.none,  no)
    -- Group.new('cStatement',         c.hue_3, c.none,  no)
    -- Group.new('cTODO',              c.hue_3, c.none,  no)
    -- Group.new('cConstant',          c.hue_6, c.none,  no)
    -- Group.new('cSpecial',           c.hue_1, c.none,  no)
    -- Group.new('cSpecialCharacter',  c.hue_1, c.none,  no)
    -- Group.new('cString',            c.hue_4, c.none,  no)
    -- Group.new('cppType',            c.hue_3, c.none,  no)
    -- Group.new('cppStorageClass',    c.hue_3, c.none,  no)
    -- Group.new('cppStructure',       c.hue_3, c.none,  no)
    -- Group.new('cppModifier',        c.hue_3, c.none,  no)
    -- Group.new('cppOperator',        c.hue_3, c.none,  no)
    -- Group.new('cppAccess',          c.hue_3, c.none,  no)
    -- Group.new('cppStatement',       c.hue_3, c.none,  no)
    -- Group.new('cppConstant',        c.hue_5, c.none,  no)
    -- Group.new('cCppString',         c.hue_4, c.none,  no)
    --
    -- -- Rust
    -- Group.new('rustExternCrate',          c.hue_5,  c.none, b)
    -- Group.new('rustIdentifier',           c.hue_2,  c.none, no)
    -- Group.new('rustDeriveTrait',          c.hue_4,  c.none, no)
    -- Group.new('SpecialComment',           c.mono_3, c.none, no)
    -- Group.new('rustCommentLine',          c.mono_3, c.none, no)
    -- Group.new('rustCommentLineDoc',       c.mono_3, c.none, no)
    -- Group.new('rustCommentLineDocError',  c.mono_3, c.none, no)
    -- Group.new('rustCommentBlock',         c.mono_3, c.none, no)
    -- Group.new('rustCommentBlockDoc',      c.mono_3, c.none, no)
    -- Group.new('rustCommentBlockDocError', c.mono_3, c.none, no)

    -- -- Cucumber
    -- Group.new('cucumberGiven',           c.hue_2, c.none,  no)
    -- Group.new('cucumberWhen',            c.hue_2, c.none,  no)
    -- Group.new('cucumberWhenAnd',         c.hue_2, c.none,  no)
    -- Group.new('cucumberThen',            c.hue_2, c.none,  no)
    -- Group.new('cucumberThenAnd',         c.hue_2, c.none,  no)
    -- Group.new('cucumberUnparsed',        c.hue_6, c.none,  no)
    -- Group.new('cucumberFeature',         c.hue_5, c.none,  b)
    -- Group.new('cucumberBackground',      c.hue_3, c.none,  b)
    -- Group.new('cucumberScenario',        c.hue_3, c.none,  b)
    -- Group.new('cucumberScenarioOutline', c.hue_3, c.none,  b)
    -- Group.new('cucumberTags',            c.mono_3,c.none,  b)
    -- Group.new('cucumberDelimiter',       c.mono_3, c.none, b)
    --
    -- -- CSS/Sass
    -- Group.new('cssAttrComma',         c.hue_3,  c.none,  no)
    -- Group.new('cssAttributeSelector', c.hue_4,  c.none,  no)
    -- Group.new('cssBraces',            c.mono_2, c.none,  no)
    -- Group.new('cssClassName',         c.hue_6,  c.none,  no)
    -- Group.new('cssClassNameDot',      c.hue_6,  c.none,  no)
    -- Group.new('cssDefinition',        c.hue_3,  c.none,  no)
    -- Group.new('cssFontAttr',          c.hue_6,  c.none,  no)
    -- Group.new('cssFontDescriptor',    c.hue_3,  c.none,  no)
    -- Group.new('cssFunctionName',      c.hue_2,  c.none,  no)
    -- Group.new('cssIdentifier',        c.hue_2,  c.none,  no)
    -- Group.new('cssImportant',         c.hue_3,  c.none,  no)
    -- Group.new('cssInclude',           c.mono_1, c.none,  no)
    -- Group.new('cssIncludeKeyword',    c.hue_3,  c.none,  no)
    -- Group.new('cssMediaType',         c.hue_6,  c.none,  no)
    -- Group.new('cssProp',              c.hue_1,  c.none,  no)
    -- Group.new('cssPseudoClassId',     c.hue_6,  c.none,  no)
    -- Group.new('cssSelectorOp',        c.hue_3,  c.none,  no)
    -- Group.new('cssSelectorOp2',       c.hue_3,  c.none,  no)
    -- Group.new('cssStringQ',           c.hue_4,  c.none,  no)
    -- Group.new('cssStringQQ',          c.hue_4,  c.none,  no)
    -- Group.new('cssTagName',           c.hue_5,  c.none,  no)
    -- Group.new('cssAttr',              c.hue_6,  c.none,  no)
    -- Group.new('sassAmpersand',        c.hue_5,  c.none,  no)
    -- Group.new('sassClass',            c.hue_6_2,c.none,  no)
    -- Group.new('sassControl',          c.hue_3,  c.none,  no)
    -- Group.new('sassExtend',           c.hue_3,  c.none,  no)
    -- Group.new('sassFor',              c.mono_1, c.none,  no)
    -- Group.new('sassProperty',         c.hue_1,  c.none,  no)
    -- Group.new('sassFunction',         c.hue_1,  c.none,  no)
    -- Group.new('sassId',               c.hue_2,  c.none,  no)
    -- Group.new('sassInclude',          c.hue_3,  c.none,  no)
    -- Group.new('sassMedia',            c.hue_3,  c.none,  no)
    -- Group.new('sassMediaOperators',   c.mono_1, c.none,  no)
    -- Group.new('sassMixin',            c.hue_3,  c.none,  no)
    -- Group.new('sassMixinName',        c.hue_2,  c.none,  no)
    -- Group.new('sassMixing',           c.hue_3,  c.none,  no)
    -- Group.new('scssSelectorName',     c.hue_6_2,c.none,  no)
    --
    -- -- Elixir highlighting
    --
    -- Group.new('elixirModuleDefine',   g.Define,     g.Define,        g.Define)
    -- Group.new('elixirAlias',          c.hue_6_2,    c.none,          no)
    -- Group.new('elixirAtom',           c.hue_1,      c.none,          no)
    -- Group.new('elixirBlockDefinition',c.hue_3,      c.none,          no)
    -- Group.new('elixirModuleDeclaration',c.hue_6,    c.none,          no)
    -- Group.new('elixirInclude',        c.hue_5,      c.none,          no)
    -- Group.new('elixirOperator',       c.hue_6,      c.none,          no)
    --
    -- -- Git and git related plugins
    -- Group.new('gitcommitComment',     c.mono_3,     c.none,          no)
    -- Group.new('gitcommitUnmerged',    c.hue_4,      c.none,          no)
    -- Group.new('gitcommitOnBranch',    c.none,       c.none,          no)
    -- Group.new('gitcommitBranch',      c.hue_3,      c.none,          no)
    -- Group.new('gitcommitDiscardedType',c.hue_5,     c.none,          no)
    -- Group.new('gitcommitSelectedType',c.hue_4,      c.none,          no)
    -- Group.new('gitcommitHeader',      c.none,       c.none,          no)
    -- Group.new('gitcommitUntrackedFile',c.hue_1,     c.none,          no)
    -- Group.new('gitcommitDiscardedFile',c.hue_5,     c.none,          no)
    -- Group.new('gitcommitSelectedFile',c.hue_4,      c.none,          no)
    -- Group.new('gitcommitUnmergedFile',c.hue_6_2,    c.none,          no)
    -- Group.new('gitcommitFile',        c.none,       c.none,          no)
    -- Group.new('gitcommitNoBranch',    g.gitcommitBranch, g.gitcommitBranch, g.gitcommitBranch)
    -- Group.new('gitcommitUntracked',   g.gitcommitComment,g.gitcommitComment,g.gitcommitComment)
    -- Group.new('gitcommitDiscarded',   g.gitcommitComment,g.gitcommitComment,g.gitcommitComment)
    -- Group.new('gitcommitDiscardedArrow',g.gitcommitDiscardedFile, g.gitcommitDiscardedFile, g.gitcommitDiscardedFile)
    -- Group.new('gitcommitSelectedArrow', g.gitcommitSelectedFile, g.gitcommitSelectedFile, g.gitcommitSelectedFile)
    -- Group.new('gitcommitUnmergedArrow', g.gitcommitUnmergedFile, g.gitcommitUnmergedFile, g.gitcommitUnmergedFile)

    -- Group.new('SignifySignAdd',       c.hue_4,      c.none,          no)
    -- Group.new('SignifySignChange',    c.hue_6_2,    c.none,          no)
    -- Group.new('SignifySignDelete',    c.hue_5,      c.none,          no)

    -- Group.new('GitGutterAdd',         g.SignifySignAdd, g.SignifySignAdd, g.SignifySignAdd)
    -- Group.new('GitGutterChange',      g.SignifySignChange, g.SignifySignChange, g.SignifySignChange)
    -- Group.new('GitGutterDelete',      g.SignifySignDelete, g.SignifySignDelete, g.SignifySignDelete)
    -- Group.new('diffAdded',            c.hue_4,      c.none,          no)
    -- Group.new('diffRemoved',          c.hue_5,      c.none,          no)
    --
    -- -- Go
    -- Group.new('goDeclaration',       c.hue_3,       c.none,          no)
    -- Group.new('goField',             c.hue_5,       c.none,          no)
    -- Group.new('goMethod',            c.hue_1,       c.none,          no)
    -- Group.new('goType',              c.hue_3,       c.none,          no)
    -- Group.new('goUnsignedInts',      c.hue_1,       c.none,          no)
    --
    -- -- Haskell highlighting
    -- Group.new('haskellDeclKeyword',  c.hue_2,       c.none,          no)
    -- Group.new('haskellType',         c.hue_4,       c.none,          no)
    -- Group.new('haskellWhere',        c.hue_5,       c.none,          no)
    -- Group.new('haskellImportKeywords',c.hue_2,      c.none,          no)
    -- Group.new('haskellOperators',    c.hue_5,       c.none,          no)
    -- Group.new('haskellDelimiter',    c.hue_2,       c.none,          no)
    -- Group.new('haskellIdentifier',   c.hue_6,       c.none,          no)
    -- Group.new('haskellKeyword',      c.hue_5,       c.none,          no)
    -- Group.new('haskellNumber',       c.hue_1,       c.none,          no)
    -- Group.new('haskellString',       c.hue_1,       c.none,          no)
    --
    -- -- HTML
    -- Group.new('htmlArg',             c.hue_6,       c.none,          no)
    -- Group.new('htmlTagName',         c.hue_5,       c.none,          no)
    -- Group.new('htmlTagN',            c.hue_5,       c.none,          no)
    -- Group.new('htmlSpecialTagName',  c.hue_5,       c.none,          no)
    -- Group.new('htmlTag',             c.mono_2,      c.none,          no)
    -- Group.new('htmlEndTag',          c.mono_2,      c.none,          no)
    -- Group.new('MatchTag',            c.hue_5,       c.syntax_cursor, ul + b)
    --
    -- -- JavaScript
    -- Group.new('coffeeString',        c.hue_4,       c.none,          no)
    -- Group.new('javaScriptBraces',    c.mono_2,      c.none,          no)
    -- Group.new('javaScriptFunction',  c.hue_3,       c.none,          no)
    -- Group.new('javaScriptIdentifier',c.hue_3,       c.none,          no)
    -- Group.new('javaScriptNull',      c.hue_6,       c.none,          no)
    -- Group.new('javaScriptNumber',    c.hue_6,       c.none,          no)
    -- Group.new('javaScriptRequire',   c.hue_1,       c.none,          no)
    -- Group.new('javaScriptReserved',  c.hue_3,       c.none,          no)
    -- Group.new('jsArrowFunction',     c.hue_3,       c.none,          no)
    -- Group.new('jsBraces',            c.mono_2,      c.none,          no)
    -- Group.new('jsClassBraces',       c.mono_2,      c.none,          no)
    -- Group.new('jsClassKeywords',     c.hue_3,       c.none,          no)
    -- Group.new('jsDocParam',          c.hue_2,       c.none,          no)
    -- Group.new('jsDocTags',           c.hue_3,       c.none,          no)
    -- Group.new('jsFuncBraces',        c.mono_2,      c.none,          no)
    -- Group.new('jsFuncCall',          c.hue_2,       c.none,          no)
    -- Group.new('jsFuncParens',        c.mono_2,      c.none,          no)
    -- Group.new('jsFunction',          c.hue_3,       c.none,          no)
    -- Group.new('jsGlobalObjects',     c.hue_6_2,     c.none,          no)
    -- Group.new('jsModuleWords',       c.hue_3,       c.none,          no)
    -- Group.new('jsModules',           c.hue_3,       c.none,          no)
    -- Group.new('jsNoise',             c.mono_2,      c.none,          no)
    -- Group.new('jsNull',              c.hue_6,       c.none,          no)
    -- Group.new('jsOperator',          c.hue_3,       c.none,          no)
    -- Group.new('jsParens',            c.mono_2,      c.none,          no)
    -- Group.new('jsStorageClass',      c.hue_3,       c.none,          no)
    -- Group.new('jsTemplateBraces',    c.hue_5_2,     c.none,          no)
    -- Group.new('jsTemplateVar',       c.hue_4,       c.none,          no)
    -- Group.new('jsThis',              c.hue_5,       c.none,          no)
    -- Group.new('jsUndefined',         c.hue_6,       c.none,          no)
    -- Group.new('jsObjectValue',       c.hue_2,       c.none,          no)
    -- Group.new('jsObjectKey',         c.hue_1,       c.none,          no)
    -- Group.new('jsReturn',            c.hue_3,       c.none,          no)
    -- Group.new('javascriptArrowFunc', c.hue_3,       c.none,          no)
    -- Group.new('javascriptClassExtends',c.hue_3,     c.none,          no)
    -- Group.new('javascriptClassKeyword',c.hue_3,     c.none,          no)
    -- Group.new('javascriptDocNotation',c.hue_3,      c.none,          no)
    -- Group.new('javascriptDocParamName',c.hue_2,     c.none,          no)
    -- Group.new('javascriptDocTags',    c.hue_3,      c.none,          no)
    -- Group.new('javascriptEndColons',  c.mono_3,     c.none,          no)
    -- Group.new('javascriptExport',     c.hue_3,      c.none,          no)
    -- Group.new('javascriptFuncArg',    c.mono_1,     c.none,          no)
    -- Group.new('javascriptFuncKeyword',c.hue_3,      c.none,          no)
    -- Group.new('javascriptIdentifier', c.hue_5,      c.none,          no)
    -- Group.new('javascriptImport',     c.hue_3,      c.none,          no)
    -- Group.new('javascriptObjectLabel',c.mono_1,     c.none,          no)
    -- Group.new('javascriptOpSymbol',   c.hue_1,      c.none,          no)
    -- Group.new('javascriptOpSymbols',  c.hue_1,      c.none,          no)
    -- Group.new('javascriptPropertyName',c.hue_4,     c.none,          no)
    -- Group.new('javascriptTemplateSB', c.hue_5_2,    c.none,          no)
    -- Group.new('javascriptVariable',   c.hue_3,      c.none,          no)

    -- -- JSON
    -- Group.new('jsonCommentError',     c.mono_1,     c.none,          no)
    -- Group.new('jsonKeyword',          c.hue_5,      c.none,          no)
    -- Group.new('jsonQuote',            c.mono_3,     c.none,          no)
    -- Group.new('jsonTrailingCommaError',c.hue_5,     c.none,          r)
    -- Group.new('jsonMissingCommaError',c.hue_5,      c.none,          r)
    -- Group.new('jsonNoQuotesError',    c.hue_5,      c.none,          r)
    -- Group.new('jsonNumError',         c.hue_5,      c.none,          r)
    -- Group.new('jsonString',           c.hue_4,      c.none,          no)
    -- Group.new('jsonBoolean',          c.hue_3,      c.none,          no)
    -- Group.new('jsonNumber',           c.hue_6,      c.none,          no)
    -- Group.new('jsonStringSQError',    c.hue_5,      c.none,          r)
    -- Group.new('jsonSemicolonError',   c.hue_5,      c.none,          r)

    -- -- Markdown
    -- Group.new('markdownUrl',          c.mono_3,     c.none,          no)
    -- Group.new('markdownBold',         c.hue_6,      c.none,          b)
    -- Group.new('markdownItalic',       c.hue_6,      c.none,          b)
    -- Group.new('markdownCode',         c.hue_4,      c.none,          no)
    -- Group.new('markdownCodeBlock',    c.hue_5,      c.none,          no)
    -- Group.new('markdownCodeDelimiter',c.hue_4,      c.none,          no)
    -- Group.new('markdownHeadingDelimiter',c.hue_5_2, c.none,          no)
    -- Group.new('markdownH1',           c.hue_5,      c.none,          no)
    -- Group.new('markdownH2',           c.hue_5,      c.none,          no)
    -- Group.new('markdownH3',           c.hue_5,      c.none,          no)
    -- Group.new('markdownH4',           c.hue_5,      c.none,          no)
    -- Group.new('markdownH5',           c.hue_5,      c.none,          no)
    -- Group.new('markdownH6',           c.hue_5,      c.none,          no)
    -- Group.new('markdownListMarker',   c.hue_5,      c.none,          no)

    -- -- PureScript
    -- Group.new('purescriptKeyword',    c.hue_3,      c.none,          no)
    -- Group.new('purescriptModuleName', c.mono_1,     c.none,          no)
    -- Group.new('purescriptIdentifier', c.mono_1,     c.none,          no)
    -- Group.new('purescriptType',       c.hue_6_2,    c.none,          no)
    -- Group.new('purescriptTypeVar',    c.hue_5,      c.none,          no)
    -- Group.new('purescriptConstructor',c.hue_5,      c.none,          no)
    -- Group.new('purescriptOperator',   c.mono_1,     c.none,          no)

    -- -- Python
    -- Group.new('pythonImport',         c.hue_3,      c.none,          no)
    -- Group.new('pythonBuiltin',        c.hue_1,      c.none,          no)
    -- Group.new('pythonStatement',      c.hue_3,      c.none,          no)
    -- Group.new('pythonParam',          c.hue_6,      c.none,          no)
    -- Group.new('pythonEscape',         c.hue_5,      c.none,          no)
    -- Group.new('pythonSelf',           c.mono_2,     c.none,          italics)
    -- Group.new('pythonClass',          c.hue_2,      c.none,          no)
    -- Group.new('pythonOperator',       c.hue_3,      c.none,          no)
    -- Group.new('pythonEscape',         c.hue_5,      c.none,          no)
    -- Group.new('pythonFunction',       c.hue_2,      c.none,          no)
    -- Group.new('pythonKeyword',        c.hue_2,      c.none,          no)
    -- Group.new('pythonModule',         c.hue_3,      c.none,          no)
    -- Group.new('pythonStringDelimiter',c.hue_4,      c.none,          no)
    -- Group.new('pythonSymbol',         c.hue_1,      c.none,          no)

    -- -- Spelling
    -- Group.new('SpellBad',             c.mono_3,     c.none,          uc)
    -- Group.new('SpellLocal',           c.mono_3,     c.none,          uc)
    -- Group.new('SpellCap',             c.mono_3,     c.none,          uc)
    -- Group.new('SpellRare',            c.mono_3,     c.none,          uc)

    -- -- XML
    -- Group.new('xmlAttrib',            c.hue_6_2,    c.none,          no)
    -- Group.new('xmlEndTag',            c.hue_5,      c.none,          no)
    -- Group.new('xmlTag',               c.hue_5,      c.none,          no)
    -- Group.new('xmlTagName',           c.hue_5,      c.none,          no)

    -- -- ZSH
    -- Group.new('zshCommands',          c.mono_1,     c.none,          no)
    -- Group.new('zshDeref',             c.hue_5,      c.none,          no)
    -- Group.new('zshShortDeref',        c.hue_5,      c.none,          no)
    -- Group.new('zshFunction',          c.hue_1,      c.none,          no)
    -- Group.new('zshKeyword',           c.hue_3,      c.none,          no)
    -- Group.new('zshSubst',             c.hue_5,      c.none,          no)
    -- Group.new('zshSubstDelim',        c.mono_3,     c.none,          no)
    -- Group.new('zshTypes',             c.hue_3,      c.none,          no)
    -- Group.new('zshVariableDef',       c.hue_6,      c.none,          no)

    -- -- Man
    -- Group.new('manTitle',             g.String,     g.String,        g.String)
    -- Group.new('manFooter',            c.mono_3,     c.none,          no)
  end
}
