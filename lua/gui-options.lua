local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
-- Make split separators transparent
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[
  highlight WinSeparator guibg=NONE guifg=NONE
]])
-- Make bufferline transparent
vim.cmd([[
  highlight BufferLineBackground guibg=NONE
  highlight BufferLineFill guibg=NONE
  highlight BufferLineBufferSelected guibg=NONE
  highlight BufferLineBuffer guibg=NONE
  highlight BufferLineSeparator guibg=NONE
  highlight BufferLineIndicatorSelected guibg=NONE
  highlight BufferLineTab guibg=NONE
  highlight BufferLineTabSelected guibg=NONE
  highlight BufferLineTabSeparator guibg=NONE
  highlight BufferLineTabSeparatorSelected guibg=NONE
]])
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- Make sign column transparent
vim.cmd([[
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight link SignColumn LineNr
]])
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word
opt.iskeyword:append("_") -- consider string_string as whole word
