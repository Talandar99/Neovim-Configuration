"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
""""""""""""""""""""""""Utilities"""""""""""""""""""""""""
"surround 
	Plug 'tpope/vim-surround'	
"Auto Pairs
	Plug 'jiangmiao/auto-pairs'
"lines movement
	Plug 'fedepujol/move.nvim'
"Colors highlight 
	Plug 'chrisbra/Colorizer'
"Discord pressence
	Plug 'andweeb/presence.nvim'
"Translation in fly
	Plug 'potamides/pantran.nvim'	
"vim wiki
	Plug 'vimwiki/vimwiki'
"bottom bar
	Plug 'nvim-lualine/lualine.nvim'

""""""""""""""""""""""""""""Theme""""""""""""""""""""""""""""
"tokyonight theme
	Plug 'folke/tokyonight.nvim'
"icons in your statusline
	Plug 'kyazdani42/nvim-web-devicons'

"""""""""""""""""""""""""Navigation"""""""""""""""""""""""""
"telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-telescope/telescope-file-browser.nvim' 
"startup
	Plug 'startup-nvim/startup.nvim'
"Harpoon
	Plug 'ThePrimeagen/harpoon'

""""""""""""""""LSP and Language support"""""""""""""""""""""
"treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
"vsnip
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
"Bash 
	Plug 'bash-lsp/bash-language-server'
"Dart/Flutter
	Plug 'Neevash/awesome-flutter-snippets'
	Plug 'dart-lang/dart-vim-plugin'
	Plug 'akinsho/flutter-tools.nvim'
"Elixir
	Plug 'mhinz/vim-mix-format'
	Plug 'elixir-lsp/elixir-ls'
"Rust
	Plug 'simrat39/rust-tools.nvim'
	Plug 'rust-lang/rust.vim'
"Java
	Plug 'mfussenegger/nvim-jdtls'


"""""""""""""""""""""""""Git""""""""""""""""""""""""""""""""
"Signify
	Plug 'mhinz/vim-signify'
"fugitive 
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'
"Branch management	
	Plug 'idanarye/vim-merginal'
"Solving merge conflicts 
	Plug 'sindrets/diffview.nvim'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Lua files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
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
require('lspconfig').elixirls.setup{
	cmd = { "/home/talandar/.config/nvim/elixir-ls/language_server.sh" }, 
	capabilities=capabilities,} -- (for elixir lsp to work properly change talandar to yout user name)
require('fluttertoolssetup') -- local
require('php_setup') -- local
require('rustanalyzersetup') -- local
require('tokyonightsetup') -- local
require('cmpsetup') -- local
require('lsp_floating_window_border') --local
require('treesitter_config') -- local
require'lspconfig'.sumneko_lua.setup {
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
EOF
