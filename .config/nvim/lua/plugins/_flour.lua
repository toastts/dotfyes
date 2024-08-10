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
    local sthr = styles.strikethrough
    local no = styles.NONE

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
    Color.new("sand10", "#7f7e77") -- fg4
    Color.new("sand11", "#a1a09a") -- fg5
    Color.new("sand12", "#ededec")

    -- Amber for base UI background
    Color.new("amber1", "#fefdfb")
    Color.new("amber2", "#fff9ed") -- bg1
    Color.new("amber3", "#fff4d5") -- bg2 slight hl cursor/col
    Color.new("amber4", "#ffecbc") -- bg3
    Color.new("amber5", "#ffe3a2") -- bg4
    Color.new("amber6", "#ffd386")
    Color.new("amber7", "#f3ba63")
    Color.new("amber8", "#ee9d2b")
    Color.new("amber9", "#ffb224") -- bg5
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

    Color.new("blue1", "#0d1520")
    Color.new("blue2", "#111927")
    Color.new("blue3", "#0d2847")
    Color.new("blue4", "#003362")
    Color.new("blue5", "#004074")
    Color.new("blue6", "#104d87")
    Color.new("blue7", "#205d9e")
    Color.new("blue8", "#2870bd")
    Color.new("blue9", "#0090ff")
    Color.new("blue10","#3b9eff")
    Color.new("blue11","#70b8ff") -- blue fg text
    Color.new("blue12","#c2e6ff") -- blue bg highlight

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

---------------------------------------------------------------------
    ---COLORSCHEME COLORS--
---------------------------------------------------------------------

    Color.new("fg1",        "#161615")           -- sand1 main text
    Color.new("fg2",        "#2e2e2b")           -- sand5
    Color.new("fg3",        "#717069")           -- sand9 subtle ui
    Color.new("fg4",        "#7f7e77")           -- sand9 subtle ui
    Color.new("fg5",        "#a1a09a")           -- sand11 comments

    Color.new("bg1",        "#fff9ed")           -- amber2 background
    Color.new("bg2",        "#fff4d5")           -- amber3 subtle hl, cursor/col
    Color.new("bg3",        "#ffecbc")           -- amber4
    Color.new("bg4",        "#ffe3a2")           -- amber5
    Color.new("bg5",        "#ffb224")           -- amber8

    -- primarily used for line numbers, maybe other UI elements
    Color.new("lcontrast",  "#ad5700")           -- amber11
    Color.new("hcontrast",  "#4e2009")           -- amber12

    Color.new("yellow",     "#f0c000")
    Color.new("yellow_bg",  "#fffad1")

    Color.new("red",        "#f16a50")      --red fg text
    Color.new("red_bg",     "#feefec")   -- red bg highlight

    Color.new("green",      "#63c174")    -- green fg text
    Color.new("green_bg",   "#e5fbeb") -- green bg highlight

    Color.new("blue",       "#70b8ff") -- blue fg text
    Color.new("blue_bg",    "#c2e6ff") -- blue bg highlight

    ----------------------
    -- Vim Editor Color --       --FG--         --BG--    --STYLE--
    ----------------------
    Group.new("Normal",          c.fg1,         c.bg1,          no)

    Group.new("ColorColumn",     c.none,        c.bg2,          no)
    Group.new("Conceal",         c.none,        c.none,         no)
    Group.new("Cursor",          c.fg1,        c.bg1,         no)
    Group.new("TermCursor",          c.fg1,        c.bg1,         no)
    Group.new("CursorIM",          c.fg1,        c.bg1,         no)
    Group.new("CursorColumn",    c.none,        c.bg2,          no)
    Group.new("CursorLine",      c.none,        c.bg2,          no)
    Group.new("Directory",       c.none,        c.none,         b)
    Group.new("ErrorMsg",        c.red,         c.none,         no)
    Group.new("VertSplit",       c.fg1,         c.none,         b)
    Group.new("Folded",          c.fg2,         c.none,         no)
    Group.new("FoldColumn",      c.fg2,         c.none,         no)
    Group.new("LineNr",          c.lcontrast,   c.none,         no)
    Group.new("CursorLineNr",    c.hcontrast,   c.none,         no)
    Group.new("MatchParen",      c.none,        c.bg4,         no)
    Group.new("Italic",          c.none,        c.none,         i)
    Group.new("ModeMsg",         c.none,        c.none,         no)
    Group.new("MoreMsg",         c.fg2,         c.none,         no)
    Group.new("NonText",         c.none,        c.none,         no)

    Group.new("IncSearch",       c.none,        c.bg3,          no)
    Group.new("CurSearch",       c.none,        c.bg5,         no)
    Group.new("Search",          c.none,        c.bg4,          no)

    Group.new("PMenu",           c.none,         c.bg3,          no)
    Group.new("PMenuSel",        c.none,         c.bg4,          no)
    Group.new("PMenuSbar",       c.none,        c.none,         no)
    Group.new("PMenuThumb",      c.none,        c.none,         no)
    Group.new("NormalFloat",     c.fg1,         c.none,         no)

    Group.new("CmpItemMenu",           c.none,         c.bg3,          no)

    Group.new("Question",        c.none,        c.none,         no)
    Group.new("SpecialKey",      c.none,        c.none,         no)
    Group.new("Whitespace",      c.none,        c.none,         no)
    -- manage status line with lualine
    -- Group.new("StatusLine",      c.none,        c.fg2,          no)
    -- Group.new("StatusLineNC",    c.none,        c.fg3,          no)

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
    Group.new("helpSectionDelim",c.none,        c.none,         b)

    ----------------------------------
-- Standard Syntax Highlighting --
----------------------------------
Group.new("Comment",         c.fg5,         c.none,    no)  -- Comments in italic

Group.new("Constant",        c.fg2,         c.none,        no)  -- Constants in bold
Group.new("String",          g.Constant,    g.Constant,    i)  -- Strings in italic
Group.new("Character",       g.Constant,    g.Constant,    i)  -- Characters in italic
Group.new("Number",          g.Constant,    g.Constant,    g.Constant)  -- Numbers in bold
Group.new("Boolean",         g.Constant,    g.Constant,    g.Constant)  -- Booleans in bold
Group.new("Float",           g.Constant,    g.Constant,    g.Constant)  -- Floats in bold

Group.new("Statement",       c.fg4,         c.none,        no)  -- Statements in bold
Group.new("Conditional",     g.Statement,   g.Statement,   g.Statement) -- Conditionals underlined
Group.new("Repeat",          g.Statement,   g.Statement,   g.Statement) -- Repeats underlined
Group.new("Label",           g.Statement,   g.Statement,   g.Statement)  -- Labels in bold
Group.new("Operator",        g.Statement,   g.Statement,   g.Statement+b) -- Operators normal style
Group.new("Keyword",         g.Statement,   g.Statement,   g.Statement) -- Keywords underlined
Group.new("Exception",       g.Statement,   g.Statement,   g.Statement) -- Exceptions underlined

Group.new("Identifier",      c.fg1,        c.none,    no) -- Identifiers underlined
Group.new("Function",        c.fg1,        c.none,    b)  -- Functions in bold

Group.new("PreProc",         c.fg3,         c.none,       b) -- Preprocessor normal style
Group.new("Include",         g.PreProc,     g.PreProc,    g.PreProc) -- Includes underlined
Group.new("Define",          g.PreProc,     g.PreProc,    g.PreProc) -- Defines underlined
Group.new("Macro",           g.PreProc,     g.PreProc,    g.PreProc) -- Macros underlined
Group.new("PreCondit",       g.PreProc,     g.PreProc,    g.PreProc) -- Preconditionals underlined

Group.new("Type",            c.fg2,         c.none,    i) -- Types normal style
Group.new("StorageClass",    g.Type,        c.none,    g.Type) -- Storage classes normal style
Group.new("Structure",       g.Type,        c.none,    g.Type) -- Structures normal style
Group.new("Typedef",         g.Type,        c.none,    g.Type)  -- Typedefs in italic

Group.new("Special",         c.fg2,         c.none,    no) -- Special elements normal style
Group.new("SpecialChar",     g.Special,     c.none,    no) -- Special characters normal style
Group.new("Tag",             g.Special,     c.none,    no) -- Tags normal style
Group.new("Delimiter",       g.Special,     c.none,    no) -- Delimiters normal style
Group.new("SpecialComment",  g.Special,     c.none,    no)  -- Special comments in italic
Group.new("Debug",           c.fg2,         c.none,    i) -- Debug normal style

Group.new("Underlined",      c.none,        c.none,    ul) -- Underlined elements underlined
Group.new("Strikethrough",   n.none,        c.none,    sthr)
Group.new("Bold",            n.none,        c.none,    b)
Group.new("Ignore",          c.fg3,         c.none,    no) -- Ignored elements normal style
Group.new("Error",           c.red,         c.none,    ul) -- Errors underlined
Group.new("Todo",            c.none,        c.none,    r)  -- Todos in bold

Group.new("Added",           c.none,       c.green_bg,    no) -- Added lines normal style
Group.new("Changed",         c.none,      c.yellow_bg,    no) -- Changed lines normal style
Group.new("Removed",         c.none,         c.red_bg,    no) -- Removed lines normal style

    -----------------------------
    -- TreeSitter Highlighting --
    -----------------------------
-----------------------------
-- TreeSitter Highlighting --
-----------------------------
Group.new("@variable",                   g.Identifier,  g.Identifier,   g.Identifier)  -- various variable names
Group.new("@variable.builtin",           g.Identifier,  g.Identifier,   g.Identifier+b)  -- built-in variable names (e.g. `this`, `self`)
Group.new("@variable.parameter",         g.Identifier,  g.Identifier,   g.Identifier+b)  -- parameters of a function
Group.new("@variable.parameter.builtin", g.Identifier,  g.Identifier,   g.Identifier+b) -- special parameters (e.g. `_`, `it`)
Group.new("@variable.member",            g.Identifier,  g.Identifier,   g.Identifier)  -- object and struct fields
Group.new("@property",                   g.Identifier,  g.Identifier,   g.Identifier)  -- the key in key/value pairs

Group.new("@constant",              g.Constant,    g.Constant,     g.Constant)    -- constant identifiers
Group.new("@constant.builtin",      g.Constant,    g.Constant,     g.Constant)    -- built-in constant values
Group.new("@constant.macro",        g.PreProc,     g.PreProc,      g.PreProc)     -- constants defined by the preprocessor

Group.new("@module",                g.PreProc,     g.PreProc,      g.PreProc)     -- modules or namespaces
Group.new("@module.builtin",        g.PreProc,     g.PreProc,      g.PreProc)     -- built-in modules or namespaces
Group.new("@label",                 g.Label,       g.Label,        g.Label)       -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

Group.new("@string",                g.String,      g.String,       g.String)      -- string literals
Group.new("@string.documentation",  g.Comment,     g.Comment,      g.Comment)     -- string documenting code (e.g. Python docstrings)
Group.new("@string.regexp",         g.String,      g.String,       g.String)      -- regular expressions
Group.new("@string.escape",         g.String,      g.String,       g.String)      -- escape sequences
Group.new("@string.special",        g.Special,     g.Special,      g.Special)     -- other special strings (e.g. dates)
Group.new("@string.special.symbol", g.Special,     g.Special,      g.Special)     -- symbols or atoms
Group.new("@string.special.path",   g.String,      g.String,       g.String)      -- filenames
Group.new("@string.special.url",    g.Underlined,  g.Underlined,   g.String)  -- URIs (e.g. hyperlinks)

Group.new("@character",             g.Character,   g.Character,    g.Character)   -- character literals
Group.new("@character.special",     g.Special,     g.Special,      g.Special)     -- special characters (e.g. wildcards)

Group.new("@boolean",               g.Boolean,     g.Boolean,      g.Boolean)     -- boolean literals
Group.new("@number",                g.Number,      g.Number,       g.Number)      -- numeric literals
Group.new("@number.float",          g.Float,       g.Float,        g.Float)       -- floating-point number literals

Group.new("@type",                  g.Type,        g.Type,         g.Type)        -- type or class definitions and annotations
Group.new("@type.builtin",          g.Type,        g.Type,         g.Type)        -- built-in types
Group.new("@type.definition",       g.Type,        g.Type,         g.Type)        -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

Group.new("@attribute",             g.Type,        g.Type,         g.Type)        -- attribute annotations (e.g. Python decorators, Rust lifetimes)
Group.new("@attribute.builtin",     g.Type,        g.Type,         g.Type)        -- builtin annotations (e.g. `@property` in Python)


    -- add ul here because default function highlights braces -_-
Group.new("@function",              g.Function,    g.Function,     g.Function+ul)    -- function definitions
Group.new("@function.builtin",      g.Function,    g.Function,     g.Function+ul)    -- built-in functions
Group.new("@function.call",         g.Function,    g.Function,     g.Function+ul)    -- function calls
Group.new("@function.macro",        g.Function,    g.Function,     g.Function+ul)    -- preprocessor macros

Group.new("@function.method",       g.Function,    g.Function,     g.Function+ul)    -- method definitions
Group.new("@function.method.call",  g.Function,    g.Function,     g.Function+ul)    -- method calls

Group.new("@constructor",           g.Function,    g.Function,     g.Function+i)    -- constructor calls and definitions
Group.new("@operator",              g.Operator,    g.Operator,     g.Operator)    -- symbolic operators (e.g. `+`, `*`)

Group.new("@keyword",               g.Keyword,     g.Keyword,      g.Keyword)     -- keywords not fitting into specific categories
Group.new("@keyword.coroutine",     g.Keyword,     g.Keyword,      g.Keyword)     -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
Group.new("@keyword.function",      g.Keyword,     g.Keyword,      g.Keyword)     -- keywords that define a function (e.g. `func` in Go, `def` in Python)
Group.new("@keyword.operator",      g.Keyword,     g.Keyword,      g.Keyword)     -- operators that are English words (e.g. `and`, `or`)
Group.new("@keyword.import",        g.Include,     g.Include,      g.Include)     -- keywords for including modules (e.g. `import`, `from` in Python)
Group.new("@keyword.type",          g.Keyword,     g.Keyword,      g.Keyword)     -- keywords defining composite types (e.g. `struct`, `enum`)
Group.new("@keyword.modifier",      g.Keyword,     g.Keyword,      g.Keyword)     -- keywords defining type modifiers (e.g. `const`, `static`, `public`)
Group.new("@keyword.repeat",        g.Repeat,      g.Repeat,       g.Repeat)      -- keywords related to loops (e.g. `for`, `while`)
Group.new("@keyword.return",        g.Keyword,     g.Keyword,      g.Keyword)     -- keywords like `return` and `yield`
Group.new("@keyword.debug",         g.Keyword,     g.Keyword,      g.Keyword)     -- keywords related to debugging
Group.new("@keyword.exception",     g.Keyword,     g.Keyword,      g.Keyword)     -- keywords related to exceptions (e.g. `throw`, `catch`)

Group.new("@keyword.conditional",       g.Conditional,   g.Conditional,   g.Conditional)  -- keywords related to conditionals (e.g. `if`, `else`)
Group.new("@keyword.conditional.ternary", g.Operator,   g.Operator,   g.Operator)  -- ternary operator (e.g. `?`, `:`)

Group.new("@keyword.directive",         g.PreProc,       g.PreProc,       g.PreProc+i)  -- various preprocessor directives and shebangs
Group.new("@keyword.directive.define",  g.PreProc,       g.PreProc,       g.PreProc)  -- preprocessor definition directives

Group.new("@punctuation.delimiter",     g.Delimiter,     g.Delimiter,     g.Delimiter)  -- delimiters (e.g. `;`, `.`, `,`)
Group.new("@punctuation.bracket",       g.Delimiter,     g.Delimiter,     g.Delimiter)  -- brackets (e.g. `()`, `{}`, `[]`)
Group.new("@punctuation.special",       g.Special,       g.Special,       g.Special)    -- special symbols (e.g. `{}` in string interpolation)

Group.new("@comment",                   g.Comment,       g.Comment,       g.Comment)    -- line and block comments
Group.new("@comment.documentation",     g.Comment,       g.Comment,       g.Comment+i)    -- comments documenting code

Group.new("@comment.error",             g.Error,         g.Error,         g.Error)      -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
Group.new("@comment.warning",           g.Todo,          g.Todo,          g.Todo)       -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
Group.new("@comment.todo",              g.Todo,          g.Todo,          g.Todo)       -- todo-type comments (e.g. `TODO`, `WIP`)
Group.new("@comment.note",              g.Todo,          g.Todo,          g.Todo)       -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

Group.new("@markup.strong",             g.Bold,          g.Bold,          g.Bold)  -- bold text
Group.new("@markup.italic",             g.Comment,       g.Comment,       g.Comment)     -- italic text
Group.new("@markup.strikethrough",      g.Strikethrough, g.Strikethrough, g.Strikethrough)  -- struck-through text
Group.new("@markup.underline",          g.Underlined,    g.Underlined,    g.Underlined)  -- underlined text (only for literal underline markup!)

Group.new("@markup.heading",            g.Underlined,    g.Underlined,    g.Underlined)  -- headings, titles (including markers)
Group.new("@markup.heading.1",          g.Underlined,    g.Underlined,    g.Underlined)  -- top-level heading
Group.new("@markup.heading.2",          g.Underlined,    g.Underlined,    g.Underlined)  -- section heading
Group.new("@markup.heading.3",          g.Underlined,    g.Underlined,    g.Underlined)  -- subsection heading
Group.new("@markup.heading.4",          g.Underlined,    g.Underlined,    g.Underlined)  -- and so on
Group.new("@markup.heading.5",          g.Underlined,    g.Underlined,    g.Underlined)  -- and so forth
Group.new("@markup.heading.6",          g.Underlined,    g.Underlined,    g.Underlined)  -- six levels ought to be enough for anybody

Group.new("@markup.quote",              g.Comment,       g.Comment,       g.Comment)     -- block quotes
Group.new("@markup.math",               g.Normal,        g.Normal,        g.Normal)      -- math environments (e.g. `$ ... $` in LaTeX)

Group.new("@markup.link",               g.Underlined,    g.Underlined,    g.Underlined)  -- text references, footnotes, citations, etc.
Group.new("@markup.link.label",         g.Underlined,    g.Underlined,    g.Underlined)  -- link, reference descriptions
Group.new("@markup.link.url",           g.Underlined,    g.Underlined,    g.Underlined)  -- URL-style links

Group.new("@markup.raw",                g.Normal,        g.Normal,        g.Normal)      -- literal or verbatim text (e.g. inline code)
Group.new("@markup.raw.block",          g.Normal,        g.Normal,        g.Normal)      -- literal or verbatim text as a stand-alone block

Group.new("@markup.list",               g.Normal,        g.Normal,        g.Normal)      -- list markers
Group.new("@markup.list.checked",       g.Normal,        g.Normal,        g.Normal)        -- checked todo-style list markers
Group.new("@markup.list.unchecked",     g.Normal,        g.Normal,        g.Normal)        -- unchecked todo-style list markers

Group.new("@diff.plus",                 g.Added,         g.Added,         g.Added)       -- added text (for diff files)
Group.new("@diff.minus",                g.Removed,       g.Removed,       g.Removed)     -- deleted text (for diff files)
Group.new("@diff.delta",                g.Changed,       g.Changed,       g.Changed)     -- changed text (for diff files)

Group.new("@tag",                       g.Tag,           g.Tag,           g.Tag)         -- XML-style tag names (e.g. in XML, HTML, etc.)
Group.new("@tag.builtin",               g.Tag,           g.Tag,           g.Tag)         -- XML-style tag names (e.g. HTML5 tags)
Group.new("@tag.attribute",             g.Identifier,    g.Identifier,    g.Identifier)  -- XML-style tag attributes
Group.new("@tag.delimiter",             g.Delimiter,     g.Delimiter,     g.Delimiter)   -- XML-style tag delimiters

    -----------------------
    -- Diff Highlighting --
    -----------------------
    Group.new("DiffAdd",            c.none,        c.green_bg,     no)
    Group.new("DiffChange",         c.none,        c.yellow_bg,    no)
    Group.new("DiffDelete",         c.none,        c.red_bg,       no)

    -----------------------------
    -- Diagnostic Highlighting --
    -----------------------------
    Group.new("DiagnosticError",      c.red,           c.none,    no)
    Group.new("DiagnosticWarn",       c.yellow,        c.none,    no)
    Group.new("DiagnosticInfo",       c.info,          c.none,    no)
    Group.new("DiagnosticHint",       c.blue,          c.none,    no)
    Group.new("DiagnosticOk",         c.green,         c.none,    no)

    Group.new("DiagnosticSignError",  c.hcontrast,     c.none,    no)
    Group.new("DiagnosticSignWarn",   c.hcontrast,     c.none,    no)
    Group.new("DiagnosticSignInfo",   c.hcontrast,     c.none,    no)
    Group.new("DiagnosticSignHint",   c.hcontrast,     c.none,    no)
    Group.new("DiagnosticSignOk",     c.hcontrast,     c.none,    no)

    -----------------------------
    --     LSP Highlighting    --
    -----------------------------
    -- Group.new("LspDiagnosticsDefaultError",              c.red,                               c.none,               no)
    -- Group.new("LspDiagnosticsDefaultWarning",            c.yellow,                            c.none,               no)
    -- Group.new("LspDiagnosticsDefaultInformation",        c.lcontrast,                         c.none,               no)
    -- Group.new("LspDiagnosticsDefaultHint",               c.fg3,                               c.none,               no)
    --
    -- Group.new("LspDiagnosticsUnderlineError",            c.red,                               c.none,               ul)
    -- Group.new("LspDiagnosticsUnderlineWarning",          c.yellow,                            c.none,               ul)
    -- Group.new("LspDiagnosticsUnderlineInformation",      g.LspDiagnosticsDefaultInformation,  c.none,               ul)
    -- Group.new("LspDiagnosticsUnderlineHint",             g.LspDiagnosticsDefaultHint,         c.none,               ul)
    --
    -- Group.new("LspDiagnosticsFloatingError",             c.red,                               c.none,               ul)
    -- Group.new("LspDiagnosticsFloatingWarning",           c.yellow,                            c.none,               ul)
    -- Group.new("LspDiagnosticsFloatingInformation",       g.LspDiagnosticsDefaultInformation,  c.none,               ul)
    -- Group.new("LspDiagnosticsFloatingHint",              g.LspDiagnosticsDefaultHint,         c.none,               ul)
    --
    -- Group.new("LspDiagnosticsSignError",                 c.red,                               c.none,               no)
    -- Group.new("LspDiagnosticsSignWarning",               c.yellow,                            c.none,               no)
    -- Group.new("LspDiagnosticsSignInformation",           g.LspDiagnosticsDefaultInformation,  c.none,               no)
    -- Group.new("LspDiagnosticsSignHint",                  g.LspDiagnosticsDefaultHint,         c.none,               no)

    -- Group.new("LspDiagnosticsVirtualTextError",          c.red,                               c.none,               no)
    -- Group.new("LspDiagnosticsVirtualTextWarning",        c.yellow,                            c.none,               no)
    -- Group.new("LspDiagnosticsVirtualTextInformation",    g.LspDiagnosticsDefaultInformation,  c.none,               no)
    -- Group.new("LspDiagnosticsVirtualTextHint",           g.LspDiagnosticsDefaultHint,         c.none,               no)

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
    Group.new("LuaLineDiffAdd",      c.green,       c.none,         b)
    -- fg background for status line
    Group.new("LuaLineDiffAdd",      c.green,       c.fg,         b)
    Group.new("LuaLineDiffChange",   c.yellow,      c.fg,         b)
    Group.new("LuaLineDiffDelete",   c.red,         c.fg,         b)

    ---------------------------
    -- FZFLUA Highlighting --
    ---------------------------


    -----------------------------
-- FzfLua Highlight Groups --
-----------------------------
    -- fzf overall
--Group.new("FzfLuaNormal",          g.Normal,              g.Normal,            g.Normal)         -- Main win fg/bg
--Group.new("FzfLuaBorder",          g.Normal,              g.Normal,            g.Normal)         -- Main win border
--Group.new("FzfLuaTitle",           g.FzfLuaNormal,        g.FzfLuaNormal,      g.FzfLuaNormal+b) -- Main win title
--Group.new("FzfLuaBackdrop",        c.none,                c.bg1,               no)               -- Backdrop color
--
--    -- fzf preview
--Group.new("FzfLuaCursor",            c.bg1,           c.fg1,           no)               -- Builtin preview Cursor
--Group.new("FzfLuaSearch",            g.CurSearch,     g.CurSearch,     g.CurSearch)      -- Builtin preview search matches
--Group.new("FzfLuaDirPart",           g.Directory,     g.Directory,     g.Directory)
--Group.new("FzfLuaFilePart",          g.FzfLuaNormal,  g.FzfLuaNormal,  g.FzfLuaNormal)
--Group.new("FzfLuaCursorLine",        g.CursorLine,    g.CursorLine,    g.CursorLine)     -- Builtin preview Cursorline
--Group.new("FzfLuaCursorLineNr",      g.CursorLineNr,  g.CursorLineNr,  g.CursorLineNr)   -- Builtin preview CursorLineNr
--Group.new("FzfLuaScrollBorderEmpty", g.FzfLuaBorder,  g.FzfLuaBorder,  g.FzfLuaBorder)           -- Builtin preview border scroll empty
--Group.new("FzfLuaScrollBorderFull",  g.FzfLuaBorder,  g.FzfLuaBorder,  g.FzfLuaBorder)           -- Builtin preview border scroll full
--Group.new("FzfLuaScrollFloatEmpty",  g.PmenuSbar,     g.PmenuSbar,     g.PmenuSbar)              -- Builtin preview float scroll empty
--Group.new("FzfLuaScrollFloatFull",   g.PmenuThumb,    g.PmenuThumb,    g.PmenuThumb)             -- Builtin preview float scroll full
--
--
--    -- fzf prompt
--Group.new("FzfLuaFzfNormal",       g.FzfLuaNormal,        g.FzfLuaNormal,      g.FzfLuaNormal)   -- fzf's fg|bg
--Group.new("FzfLuaFzfBorder",       g.FzfLuaBorder,        g.FzfLuaBorder,      g.FzfLuaBorder)   -- fzf's border
--Group.new("FzfLuaFzfScrollbar",    c.none,                c.bg1,               no)               -- fzf's scrollbar
--Group.new("FzfLuaFzfGutter",       c.none,                c.bg1,               no)               -- fzf's gutter (hl bg is used)
--Group.new("FzfLuaFzfHeader",       g.FzfLuaTitle,         g.FzfLuaTitle,       g.FzfLuaTitle)    -- fzf's header
--Group.new("FzfLuaFzfSeparator",    g.FzfLuaBorder,        g.FzfLuaBorder,      g.FzfLuaBorder)   -- fzf's separator
--Group.new("FzfLuaFzfCursorLine",   g.FzfLuaCursorLine,    g.FzfLuaCursorLine,  g.FzfLuaCursorLine) -- fzf's fg+|bg+
--Group.new("FzfLuaFzfQuery",        g.FzfLuaTitle,         g.FzfLuaTitle,       g.FzfLuaTitle)    -- fzf's header
--Group.new("FzfLuaFzfPrompt",       g.Special,             g.Special,           g.Special)        -- fzf's prompt
--Group.new("FzfLuaFzfPointer",      g.FzfLuaNormal,        g.FzfLuaNormal,      g.FzfLuaNormal)   -- fzf's pointer
--
---- Group.new("FzfLuaFzfInfo",           g.NonText,       g.NonText,       g.NonText)       -- fzf's info
---- Group.new("FzfLuaFzfPointer",        g.Special,       g.Special,       g.Special)       -- fzf's pointer
---- Group.new("FzfLuaFzfMarker",         g.FzfLuaFzfPointer, g.FzfLuaFzfPointer, g.FzfLuaFzfPointer) -- fzf's marker
---- Group.new("FzfLuaFzfSpinner",        g.FzfLuaFzfPointer, g.FzfLuaFzfPointer, g.FzfLuaFzfPointer) -- fzf's spinner
--
--
--
--Group.new("FzfLuaHeaderBind",        g.FzfLuaNormal,  g.FzfLuaNormal,  g.FzfLuaNormal)           -- Header keybind
--Group.new("FzfLuaHeaderText",        g.FzfLuaNormal,  g.FzfLuaNormal, g.FzfLuaNormal)            -- Header text
--
--Group.new("FzfLuaBufName",           g.FzfLuaNormal,  g.FzfLuaNormal,  g.FzfLuaNormal)  -- Buffer name (lines)
--Group.new("FzfLuaBufNr",             g.Keyword,       g.Keyword,       g.Keyword) -- Buffer number (all buffers)
--Group.new("FzfLuaBufFlagCur",        g.FzfLuaNormal,  g.FzfLuaNormal,  g.FzfLuaNormal+b)        -- Buffer line (buffers)
--Group.new("FzfLuaBufFlagAlt",        c.fg3,           g.FzfLuaNormal,  g.FzfLuaNormal)    -- Buffer line (buffers)
--
---- Group.new("FzfLuaHelpNormal",        g.FzfLuaNormal,  g.FzfLuaNormal,  g.FzfLuaNormal)        -- Help win fg/bg
---- Group.new("FzfLuaHelpBorder",        g.FzfLuaBorder,  g.FzfLuaBorder,  g.FzfLuaBorder)        -- Help win border
---- Group.new("FzfLuaPathColNr",         g.Normal,        g.Normal,        g.Normal)              -- Path col nr (lines,qf,lsp,diag)
---- Group.new("FzfLuaPathLineNr",        g.Normal,        g.Normal,        g.Normal)              -- Path line nr (lines,qf,lsp,diag)
---- Group.new("FzfLuaDirIcon",           g.Directory,     g.Directory,     g.Directory)     -- Paths directory icon
---- Group.new("FzfLuaFilePart",          c.none,          c.none,          no)          -- Path formatters file hl croup
---- Group.new("FzfLuaDirPart",           g.Comment,       g.Comment,       g.Comment)       -- Path formatters directory hl group
--
---- Group.new("FzfLuaTabTitle",          g.LightSkyBlue1, g.LightSkyBlue1, g.LightSkyBlue1) -- Tab title (tabs)
---- Group.new("FzfLuaTabMarker",         g.BlancedAlmond, g.BlancedAlmond, g.BlancedAlmond) -- Tab marker (tabs)
---- Group.new("FzfLuaLiveSym",           g.Normal,        c.bg4,        b)        -- LSP live symbols query match


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
