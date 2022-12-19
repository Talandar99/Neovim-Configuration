-- Packer autoinstalation
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'-- Package manager
	use 'tpope/vim-surround'--surround 
	use 'jiangmiao/auto-pairs'--Auto Pairs
	use 'fedepujol/move.nvim'--lines movement
	use 'chrisbra/Colorizer'--Colors highlight 
	use 'andweeb/presence.nvim'--Discord pressence
	use 'potamides/pantran.nvim'--Translation in fly
	use 'vimwiki/vimwiki'--vim wiki
	use 'nvim-lualine/lualine.nvim'--bottom bar 
	use 'folke/tokyonight.nvim'--tokyonight theme
	use 'kyazdani42/nvim-web-devicons'--icons in your statusline
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'startup-nvim/startup.nvim'--startup
	use 'ThePrimeagen/harpoon'--Harpoon
	use 'neovim/nvim-lspconfig'--LSP
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'--vsnip
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use 'bash-lsp/bash-language-server'--Bash 
	use 'Neevash/awesome-flutter-snippets'--Dart/Flutter
	use 'dart-lang/dart-vim-plugin'
	use 'akinsho/flutter-tools.nvim'
	use 'mhinz/vim-mix-format'--Elixir
	use 'elixir-lsp/elixir-ls'
	use 'simrat39/rust-tools.nvim'--Rust
	use 'rust-lang/rust.vim'
	use 'mhinz/vim-signify'--Signify
	use 'tpope/vim-fugitive'--fugitive 
	use 'tpope/vim-rhubarb'
	use 'junegunn/gv.vim'
	use 'idanarye/vim-merginal'--Branch management
	use 'sindrets/diffview.nvim'--Solving merge conflicts 
	use 'glepnir/lspsaga.nvim'--lsp saga
	use "lukas-reineke/indent-blankline.nvim" -- indent blankline
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }-- Telescope
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  	use { -- Highlight, edit, and navigate code
    	'nvim-treesitter/nvim-treesitter',
    	run = function()
      		pcall(require('nvim-treesitter.install').update { with_sync = true })
    	end,}
  	use { -- Additional text objects via treesitter
    	'nvim-treesitter/nvim-treesitter-textobjects',
    	after = 'nvim-treesitter',}
  	if is_bootstrap then
   		require('packer').sync()
  	end
end)


require("indent_blankline").setup {
	show_current_context = true,
    show_current_context_start = true,
}
if is_bootstrap then
  print '=================================='
  print '    useins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})



require('initial_setup') --local
require('key_mappings') --local
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('rust-tools').setup{capabilities = capabilities}
require("telescope").load_extension "file_browser"
require("telescope").load_extension "harpoon"
require("startup").setup({theme = "talandar"}) -- put theme name here
require('lspconfig').bashls.setup{capabilities=capabilities}
require('lspconfig').html.setup{capabilities = capabilities}
require('php_setup') -- local
require('rustanalyzersetup') -- local
require('fluttertoolssetup') -- local
require('lua_setup') -- local
require('lspconfig').elixirls.setup{
	cmd = { "/home/talandar/.config/nvim/elixir-ls/language_server.sh" },
	capabilities=capabilities,} -- (for elixir lsp to work properly change talandar to yout user name)
require('cmpsetup') -- local
require('lsp_floating_window_border') --local
require('treesitter_config') -- local
require('tokyonightsetup') -- local
