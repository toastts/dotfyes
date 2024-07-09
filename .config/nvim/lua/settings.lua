local set = vim.opt
local map = vim.keymap.set

set.colorcolumn   = "80"
set.autoindent    = true -- Copy indent from current line when starting a new line.
set.autoread      = true -- Automatically reread changed files without asking me anything
set.autowrite     = true -- Automatically save before :next, :make etc.
set.background    = "light"
set.backspace     = {'indent', 'eol', 'start'} -- Makes backspace key more powerful.
set.belloff       = "all" -- Annoying bell off
set.cindent       = true -- stricter rules for C programs
set.cmdheight     = 2
set.concealcursor = "n"
set.conceallevel  = 0
set.cursorcolumn  = true
set.cursorline    = true -- highlight line of cursor
set.display:append "lastline"
set.encoding       = "utf-8" -- Set default encoding to UTF-8
set.expandtab      = true -- Always uses spaces instead of tab characters (et).
set.fileformats    = {'unix', 'mac', 'dos', } -- Prefer Unix over Windows over OS 9 formats
set.formatoptions  = 'cqn' -- see :h fo-table for these options
set.gdefault       = true -- Use 'g' flag by default with :s/foo/bar/.
set.hidden         = true
set.hlsearch       = true -- Highlight found searches
set.ignorecase     = true -- Search case insensitive...
set.incsearch      = true -- Shows the match while typing
set.laststatus     = 2
set.linebreak      = true
set.linespace      = 0 -- Set line-spacing to minimum.
set.modeline       = true -- Enable modeline.
set.mouse          = ""
set.backup       = false -- Don't create annoying backup files
set.errorbells   = false -- No beeps
set.joinspaces   = false -- Prevents inserting two spaces after punctuation on a join (J)
set.showmode     = false -- don't set the -- MODE -- message at bottom
set.startofline  = false -- Do not jump to first character with page commands.
set.writebackup  = false
set.number         = true
set.pumheight      = 10
set.relativenumber = true -- current line number, all else are relative
set.shiftwidth     = 2 -- Size of an indentation (sw).
set.shortmess:append "c"
set.showcmd = true -- Show me what I'm typing
set.showmatch = true -- Do not show matching brackets by flickering
set.signcolumn = "yes"
set.smartcase = true -- no ignore case for searches with cases
set.smartindent = true -- does the right thing in most programs
set.smarttab = true -- Inserts blanks on a <Tab> key (as per sw, ts and sts).
set.softtabstop = 0 -- Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set.splitbelow = true -- Horizontal split below current.
set.splitright = true -- Vertical split to right of current.
set.tabstop = 2 -- Size of a hard tabstop (ts).
set.termguicolors = true
set.textwidth = 0 -- Hard-wrap long lines as you type them.
set.undofile = true -- set undo files
set.updatecount = 100
set.updatetime = 200
set.wildmenu = true
set.wrap = true
set.scrolloff = 3
set.sidescrolloff = 5
set.spell = false

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = "",
  })
end

sign({ name = "DiagnosticSignError",text = "▐" })
sign({ name = "DiagnosticSignWarn", text = "▐" })
sign({ name = "DiagnosticSignHint", text = "▐" })
sign({ name = "DiagnosticSignInfo", text = "⚑" })
