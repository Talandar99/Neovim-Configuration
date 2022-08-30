"s""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
	"LSP language server 
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
	" For vsnip users.
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	"Auto Pairs
	Plug 'jiangmiao/auto-pairs'
	"Rust 
	Plug 'simrat39/rust-tools.nvim'
	"Dart
	Plug 'dart-lang/dart-vim-plugin'
	Plug 'akinsho/flutter-tools.nvim'
	"telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-telescope/telescope-file-browser.nvim' "dont work yet ----
	"lines movement
	Plug 'fedepujol/move.nvim'
	" Snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'natebosch/dartlang-snippets'
	" Git
	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'
	" Theme
	Plug 'folke/tokyonight.nvim'
	"icons in your statusline choose one of these
	Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	let g:lightline = {'colorscheme': 'tokyonight'}
	let	g:tokyonight_style = "night"
	set number
	set termguicolors
	syntax on
	set t_Co=256
	set cursorline
	let g:airline_theme='onehalfdark'
  	set splitbelow
	set encoding=UTF-8
	" Don't add sounds for errors
	set noerrorbells                                              	
	set number
	set nowrap
	set nobackup
	set nohlsearch
	set smartcase
	set noswapfile
	set nobackup
	set undodir=~/AppData/Local/nvim-data/backup
	set undofile
	set incsearch
	set tabstop=2
	set softtabstop=0 noexpandtab
	set shiftwidth=2
	set colorcolumn=120
	set clipboard=unnamedplus
	set backspace=indent,eol,start
	set updatetime=300
	set signcolumn=yes
	"highlight ColorColumn ctermbg=0 guibg=lightgrey
	let g:rust_cargo_check_all_targets = 1
	"autosave options
	let g:rustfmt_autosave = 1
	let g:dart_format_on_save = 1
	let g:dartfmt_options = ['--fix', '--line-length 120']
	" Change these if you want
	let g:signify_sign_add               = '+'
	let g:signify_sign_delete            = '_'
	let g:signify_sign_delete_first_line = '‾'
	let g:signify_sign_change            = '~'
	let g:signify_disable_by_default = 1 
 	" I find the numbers disctracting
	let g:signify_sign_show_count = 0
	let g:signify_sign_show_text = 1
	 "highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
	colorscheme tokyonight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	let mapleader=" "
	"Flutter
 	nnoremap <leader>fe :FlutterEmulators<CR>
	nnoremap <leader>fr :FlutterRun<CR>
	nnoremap <leader>ft :FlutterOutlineToggle<CR>
	nnoremap <leader>fq :FlutterQuit<CR>
	"Rust
	nnoremap <leader>cb :Cargo build <CR>
	nnoremap <leader>cc :Cargo check <CR>
	nnoremap <leader>cr :Cargo run <CR>
	"quit
	nnoremap <leader>q :q <CR>
	nnoremap <leader>wq :wq!<CR> 

	"open telescope (close have same binding)
	nnoremap <C-c> :Telescope find_files<CR>

	"split jumping
	nnoremap <leader>h <C-w>h
	nnoremap <leader>j <C-w>j
	nnoremap <leader>k <C-w>k
	nnoremap <leader>l <C-w>l
	"moving lines
	nnoremap <silent> <A-j> :MoveLine(1)<CR>
	nnoremap <silent> <A-k> :MoveLine(-1)<CR>
	vnoremap <silent> <A-j> :MoveBlock(1)<CR>
	vnoremap <silent> <A-k> :MoveBlock(-1)<CR>
	nnoremap <silent> <A-l> :MoveHChar(1)<CR>
	nnoremap <silent> <A-h> :MoveHChar(-1)<CR>
	vnoremap <silent> <A-l> :MoveHBlock(1)<CR>
	vnoremap <silent> <A-h> :MoveHBlock(-1)<CR>
	" Jump though hunks
	nmap <leader>gj <plug>(signify-next-hunk)
	nmap <leader>gk <plug>(signify-prev-hunk)
  nmap <leader>st :SignifyToggle<CR> 
	nmap <leader>sh :SignifyToggleHighlight<CR>

	" LSP config 
	nnoremap <silent> ty <cmd>tab split <CR>
	nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
	nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
	nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
 	nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
	" Open code actions for the selected visual range
	nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
	xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
	nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
	nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
	nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"no arrows
    nnoremap <buffer> <Left> <Esc>:echo 'you are weak'<CR>
    nnoremap <buffer> <Right> <Esc>:echo 'you are weak'<CR>
    nnoremap <buffer> <Up> <Esc>:echo 'you are weak'<CR>
    nnoremap <buffer> <Down> <Esc>:echo 'you are weak'<CR>
    nnoremap <buffer> <PageUp> <Esc>:echo 'you are weak'<CR>
    nnoremap <buffer> <PageDown> <Esc>:echo 'you are weak'<CR>
    inoremap <buffer> <Left> <Esc>:echo 'you are weak'<CR>
    inoremap <buffer> <Right> <Esc>:echo 'you are weak'<CR>
    inoremap <buffer> <Up> <Esc>:echo 'you are weak'<CR>
    inoremap <buffer> <Down> <Esc>:echo 'you are weak'<CR>
    inoremap <buffer> <PageUp> <Esc>:echo 'you are weak'<CR>
    inoremap <buffer> <PageDown> <Esc>:echo 'you are weak'<CR>
    vnoremap <buffer> <Left> <Esc>:echo 'you are weak'<CR>
    vnoremap <buffer> <Right> <Esc>:echo 'you are weak'<CR>
    vnoremap <buffer> <Up> <Esc>:echo 'you are weak'<CR>
    vnoremap <buffer> <Down> <Esc>:echo 'you are weak'<CR>
    vnoremap <buffer> <PageUp> <Esc>:echo 'you are weak'<CR>
    vnoremap <buffer> <PageDown> <Esc>:echo 'you are weak'<CR>

	" auto-format
"	autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"	autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"	autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=menu,menuone,noselect
lua require'lspconfig'.rust_analyzer.setup({})
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require("flutter-tools").setup{capabilities = capabilities} -- use defaults
	--require('lspconfig').rust_analyzer.setup{capabilities = capabilities}
	require('rust-tools').setup{capabilities = capabilities}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require('cmp')
cmp.setup {
  mapping = {

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }
}

EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Links
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	
	"dart for vim plugin 
	"https://github.com/akinsho/flutter-tools.nvim
	
	"language server configurations
	"https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls

