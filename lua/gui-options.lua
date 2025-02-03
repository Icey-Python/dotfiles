local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.iskeyword:append("_")

-- Function to set transparent background
local function set_transparency()
  vim.cmd([[
    highlight Normal guibg=NONE ctermbg=NONE
    highlight WinSeparator guibg=NONE guifg=NONE
    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight link SignColumn LineNr
    highlight BufferLineFill guibg=NONE
    highlight BufferLineBackground guibg=NONE
    highlight BufferLineBufferSelected guibg=NONE
    highlight BufferLineBuffer guibg=NONE
    highlight BufferLineSeparator guibg=NONE
    highlight BufferLineIndicatorSelected guibg=NONE
    highlight BufferLineTab guibg=NONE
    highlight BufferLineTabSelected guibg=NONE
    highlight BufferLineTabSeparator guibg=NONE
    highlight BufferLineTabSeparatorSelected guibg=NONE
  ]])
end

-- Apply transparency on startup
set_transparency()

-- Ensure transparency is applied when colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparency,
})
