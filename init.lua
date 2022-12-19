-- Packer autoinstalation x
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
--surround 
	use 'tpope/vim-surround'	
--Auto Pairs
	use 'jiangmiao/auto-pairs'
--lines movement
	use 'fedepujol/move.nvim'
--Colors highlight 
	use 'chrisbra/Colorizer'
--Discord pressence
	use 'andweeb/presence.nvim'
--Translation in fly
	use 'potamides/pantran.nvim'	
--vim wiki
	use 'vimwiki/vimwiki'
--bottom bar
	use 'nvim-lualine/lualine.nvim'
--""""""""""""""""""""""""""""Theme""""""""""""""""""""""""""""
--tokyonight theme
	use 'folke/tokyonight.nvim'
--icons in your statusline
	use 'kyazdani42/nvim-web-devicons'
--"""""""""""""""""""""""""Navigation"""""""""""""""""""""""""
	use 'nvim-telescope/telescope-file-browser.nvim' 
--startup
	use 'startup-nvim/startup.nvim'
--Harpoon
	use 'ThePrimeagen/harpoon'
--Lsp
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
--vsnip
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
--Bash 

	use 'bash-lsp/bash-language-server'
--Dart/Flutter
	use 'Neevash/awesome-flutter-snippets'
	use 'dart-lang/dart-vim-plugin'
	use 'akinsho/flutter-tools.nvim'
--Elixir
	use 'mhinz/vim-mix-format'
	use 'elixir-lsp/elixir-ls'
--Rust
	use 'simrat39/rust-tools.nvim'
	use 'rust-lang/rust.vim'
--Java
	use 'mfussenegger/nvim-jdtls'
--"""""""""""""""""""""""""Git""""""""""""""""""""""""""""""""
--Signify
	use 'mhinz/vim-signify'
--fugitive 
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'junegunn/gv.vim'
--Branch management	
	use 'idanarye/vim-merginal'
--Solving merge conflicts 
	use 'sindrets/diffview.nvim'

  use { -- LSP Configuration & useins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  }
	use {'glepnir/lspsaga.nvim'}
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'

  use 'folke/tokyonight.nvim'
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


  if is_bootstrap then
    require('packer').sync()
  end
end)

if is_bootstrap then
  print '=================================='
  print '    useins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
require('initial_setup') --local
require('key_mappings') --local
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lualine').setup()
require('rust-tools').setup{capabilities = capabilities}
require("telescope").load_extension "file_browser"
require("telescope").load_extension "harpoon"
require("startup").setup({theme = "talandar"}) -- put theme name here
require('lspconfig').bashls.setup{capabilities=capabilities}
require('lspconfig').html.setup{capabilities = capabilities}
require('php_setup') -- local
require('rustanalyzersetup') -- local
require('fluttertoolssetup') -- local
require('lspconfig').sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
require('lspconfig').elixirls.setup{
	cmd = { "/home/talandar/.config/nvim/elixir-ls/language_server.sh" }, 
	capabilities=capabilities,} -- (for elixir lsp to work properly change talandar to yout user name)
require('cmpsetup') -- local
require('lsp_floating_window_border') --local
require('treesitter_config') -- local
require('tokyonightsetup') -- local
