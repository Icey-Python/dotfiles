-- GUI CONFIGURATIONS
-- Colorscheme default
vim.cmd [[colorscheme retrobox]]

-- Italize comments
vim.g.nightflyItalics = false
-- Cursor color 
vim.g.nightflyCursorColor = true

-- popup colors 
vim.g.nightflyNormalFloat = true

-- Popup Window Display 
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = "single"
    }
  )
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
      border = "single"
    }
  )
  vim.diagnostic.config({ float = { border = "single" } })
-- Nvim file explorer
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  -- 	git = {
  -- 		ignore = false,
  -- 	},
})
-- Commenting with gc
local setup,comment = pcall(require,"Comment")
if not setup then
  return
end

comment.setup()

-- bufferline
require("bufferline").setup{}
