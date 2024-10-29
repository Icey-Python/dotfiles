local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
d]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	
-- plenaary
use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

-- Install Which Key
  	use ("folke/which-key.nvim")
-- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
    -- Rose Theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    use("nvim-tree/nvim-tree.lua")
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context");
    use { "wakatime/vim-wakatime", commit = "" }
    use { "lewis6991/gitsigns.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters


    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- code formatter 
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })
  -- flutter tools
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      require('flutter-tools').setup{} -- Adjust configuration as needed
    end
  }

  -- gpt 
use({
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})
  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets
 --  managing & installing lsp servers, linters & formatters 
 use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'mlaursen/vim-react-snippets' }
        }
    }
use {
  'Exafunction/codeium.vim',
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}
  -- configures python syntax highlighting
 -- configuring lsp servers
  -- use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
    use("preservim/nerdcommenter")
    use("folke/zen-mode.nvim")
    --AI for copilot
    -- use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")
    use("bluz71/vim-nightfly-colors")
    -- Lavi colorscheme
    use('rktjmp/lush.nvim')
    use('b0o/lavi.nvim')
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
     -- statusline
     use('nvim-lualine/lualine.nvim')
     use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
     -- bufferline
     use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
-- cattapucini theme 
 use{"catppuccin/nvim", lazy = true, name = "catppuccin", priority=1000}
  -- commenting with gc
  use("numToStr/Comment.nvim")
 -- mini icons 
 use{'echasnovski/mini.nvim', version = false}
 -- ray-x 
 use{
   "ray-x/lsp_signature.nvim",
   config = function()
     require("lsp_signature").setup({
       bind = true,
       handler_opts = {
         border = "rounded",
       },
     })
   end
 }
end)
