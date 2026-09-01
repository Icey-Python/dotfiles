-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

-- Modern which-key v3 setup (minimal, no deprecated fields)
wk.setup({
  preset = "classic",
  delay = 200,
  win = {
    border = "rounded",
    padding = { 1, 2 },
    title = true,
    title_pos = "center",
    zindex = 1000,
  },
  layout = {
    width = { min = 20 },
    spacing = 3,
  },
  keys = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
    ellipsis = "…",
    mappings = true,
  },
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  sort = { "local", "order", "group", "alphanum", "mod" },
  expand = 0,
  notify = true,
})

-- Minimal leader groups (no overlapping prefixes)
-- Singletons: w save, q quit, c close, e explorer, h nohl, b buffers
-- Groups: a=AI, f=file, g=git, l=lsp, p=packer, s=search, t=terminal/tabs, W=window, r=run
wk.add({
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
  { "<leader>c", "<cmd>bdelete!<CR>", desc = "Close Buffer" },
  { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer=false})<CR>", desc = "Buffers" },

  { "<leader>a", group = "AI" },
  { "<leader>ac", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
  { "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
  { "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
  { "<leader>at", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
  { "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
  { "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
  { "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
  { "<leader>as", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
  { "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
  { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },

  { "<leader>f", group = "File" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
  { "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
  { "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Grep string" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
  { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },

  { "<leader>g", group = "Git" },
  { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
  { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Branches" },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
  { "<leader>gf", "<cmd>Telescope git_bcommits<CR>", desc = "File commits" },

  { "<leader>l", group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", desc = "Format" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
  { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Document Diagnostics" },
  { "<leader>lw", "<cmd>Telescope diagnostics<CR>", desc = "Workspace Diagnostics" },
  { "<leader>li", "<cmd>LspInfo<CR>", desc = "Lsp Info" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Quickfix" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
  { "<leader>lrR", "<cmd>LspRestart<CR>", desc = "Restart LSP" },

  { "<leader>p", group = "Packer" },
  { "<leader>pc", "<cmd>PackerCompile<CR>", desc = "Compile" },
  { "<leader>pi", "<cmd>PackerInstall<CR>", desc = "Install" },
  { "<leader>ps", "<cmd>PackerSync<CR>", desc = "Sync" },
  { "<leader>pS", "<cmd>PackerStatus<CR>", desc = "Status" },
  { "<leader>pu", "<cmd>PackerUpdate<CR>", desc = "Update" },

  { "<leader>s", group = "Search" },
  { "<leader>sc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
  { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
  { "<leader>sC", "<cmd>Telescope commands<CR>", desc = "Commands" },
  { "<leader>sr", "<cmd>Telescope registers<CR>", desc = "Registers" },

  { "<leader>t", group = "Terminal/Tabs" },
  { "<leader>tn", "<cmd>terminal<CR>", desc = "New terminal" },
  { "<leader>tt", "<cmd>terminal top<CR>", desc = "Top" },
  { "<leader>to", "<cmd>tabnew<CR>", desc = "New tab" },
  { "<leader>tx", "<cmd>tabclose<CR>", desc = "Close tab" },
  { "<leader>tk", "<cmd>tabn<CR>", desc = "Next tab" },
  { "<leader>tj", "<cmd>tabp<CR>", desc = "Prev tab" },

  { "<leader>W", group = "Window" },
  { "<leader>Wv", "<C-w>v", desc = "Split vertical" },
  { "<leader>Wh", "<C-w>s", desc = "Split horizontal" },
  { "<leader>We", "<C-w>=", desc = "Equal splits" },
  { "<leader>Wx", "<cmd>close<CR>", desc = "Close split" },
  { "<leader>Wm", "<cmd>MaximizerToggle<CR>", desc = "Maximize" },

  { "<leader>r", group = "Run" },
  { "<leader>rp", "<cmd>terminal python3 %<CR>", desc = "Run Python" },
  { "<leader>rc", "<cmd>!g++ -std=c++11 % -o %:r<CR><cmd>! ./%:r<CR>", desc = "Run C++" },
})

----------------------
-- General Keymaps (no leader overlaps)
----------------------
keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
keymap.set("n", "x", '"_x', { noremap = true, silent = true })
keymap.set("n", "<leader>+", "<C-a>", { noremap = true, silent = true, desc = "Increment" })
keymap.set("n", "<leader>-", "<C-x>", { noremap = true, silent = true, desc = "Decrement" })

-- Move lines
local line_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", line_opts)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", line_opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", line_opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", line_opts)
vim.keymap.set("x", "p", '"_dP', line_opts)

-- Buffers
vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer" })

-- LSP free keys (non-leader)
keymap.set("n", "vd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Goto definition" })
keymap.set("n", "ve", "<cmd>lua vim.diagnostic.open_float({border='rounded', scope='line'})<CR>", { noremap = true, silent = true, desc = "Line diagnostics" })
keymap.set("n", "<leader>da", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true, desc = "Code action" })
keymap.set("n", "<leader>fr", "<cmd>FlutterReload<CR>", { noremap = true, silent = true, desc = "Flutter Reload" })
keymap.set("n", "<leader>ct", "<cmd>WakaTimeToday<CR>", { noremap = true, silent = true, desc = "Waka Today" })

-- Indent
keymap.set("v", "<S-Right>", ">gv", { noremap = true, silent = true })
keymap.set("v", "<S-Left>", "<gv", { noremap = true, silent = true })
