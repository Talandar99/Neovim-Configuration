"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
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
"Harpoon
	Plug 'ThePrimeagen/harpoon'
"LSP language server 
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
	Plug 'Neevash/awesome-flutter-snippets'
"For vsnip users.
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
"Git
	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'
"Rust
	Plug 'simrat39/rust-tools.nvim'
	Plug 'rust-lang/rust.vim'
"Dart
	Plug 'dart-lang/dart-vim-plugin'
	Plug 'akinsho/flutter-tools.nvim'
"Java
	Plug 'mfussenegger/nvim-jdtls'
"surround 
	Plug 'tpope/vim-surround'	
"Auto Pairs
	Plug 'jiangmiao/auto-pairs'
"telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-telescope/telescope-file-browser.nvim' "dont work yet ----
"lines movement
	Plug 'fedepujol/move.nvim'
"Branch management	
	Plug 'idanarye/vim-merginal'
" Theme
	Plug 'folke/tokyonight.nvim'
	Plug 'Mofiqul/vscode.nvim'
"icons in your statusline choose one of these
	Plug 'kyazdani42/nvim-web-devicons'
"dims innactive split
	Plug 'sunjon/shade.nvim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=menu,menuone,noselect
set relativenumber
set number
set termguicolors
set signcolumn=yes
syntax on
set t_Co=256
set cursorline
set splitbelow
set encoding=UTF-8
set noerrorbells                                              	
set nowrap
set nobackup
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/nvim-data/backup
set undofile
set incsearch
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
"set colorcolumn=120
set clipboard=unnamedplus
set backspace=indent,eol,start
set updatetime=300
let g:rust_cargo_check_all_targets = 1
let g:rustfmt_autosave = 1
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_disable_by_default = 1 
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown', 'ext': '.md'}]
let g:lightline = {'colorscheme': 'tokyonight'}
colorscheme tokyonight-night

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

"Colorizer toggle
nnoremap <leader>ct <cmd>ColorToggle<CR>

"Git Merginal
nmap <leader>tt :MerginalToggle<CR>

"Format json
nnoremap <leader>js <cmd>%!python -m json.tool<CR>

"Flutter
nnoremap <leader>fd :FlutterDevices<CR>
nnoremap <leader>fe :FlutterEmulators<CR>
nnoremap <leader>fto :FlutterToolsOpen<CR>
nnoremap <leader>fr :FlutterRun<CR>
nnoremap <leader>fq :FlutterQuit<CR>

"Rust
nnoremap <leader>cx :Cargo build <CR>
nnoremap <leader>cc :Cargo check <CR>
nnoremap <leader>cd :Cargo doc --open<CR>
nnoremap <leader>cu :Cargo update <CR>
nnoremap <leader>cv :Cargo run <CR>

"quit
nnoremap <leader>q :q <CR>
nnoremap <leader>wq :bufdo wq!<CR> 
nnoremap <leader>wf :w!<CR> 
nnoremap <leader>aa :wa!<CR>	

"paste and don't save previous option
xnoremap <leader>p "_d1hp

"Trigger Translation
nnoremap <Leader>tre <cmd>Pantran source=pl engine=google<CR> 
nnoremap <Leader>trd <cmd>Pantran source=en target=pl engine=google<CR> 

"open telescope (close have same binding)
nnoremap <C-c> :Telescope find_files<CR>
nnoremap <C-s> :Telescope buffers<CR>
nnoremap <C-z> :Telescope file_browser<CR>

"Harpoon
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader>8 :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <leader>we :lua require("harpoon.mark").add_file()<CR> 
nnoremap <leader>ee :lua require("harpoon.ui").toggle_quick_menu()<CR>

"create split
nnoremap <leader>sv <cmd>vsplit<>
nnoremap <silent> ty <cmd>tab split <CR>

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

"Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>st :SignifyToggle<CR> 
nmap <leader>sh :SignifyToggleHighlight<CR>

"Git fugitive
nmap gq <cmd>0G<CR>
nmap gds :Gvdiffsplit!<CR>
nmap gps :Git push
nmap gpl :Git pull
nmap gfc :Git fetch
nmap grh :Git reset --hard
nmap gbl :Git blame<CR>


"LSP config 
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

"Open code actions for the selected visual range
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

"Dont use arrows
map <Left> <Esc>:echo 'you are weak'<CR>
map <Right> <Esc>:echo 'you are weak'<CR>
map <Up> <Esc>:echo 'you are weak'<CR>
map <Down> <Esc>:echo 'you are weak'<CR>
map <PageUp> <Esc>:echo 'you are weak'<CR>
map <PageDown> <Esc>:echo 'you are weak'<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Lua dependency files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('nvimlspinstaller') --local
require('cmpsetup') -- local
require('rust-tools').setup{capabilities = capabilities}
require('rustanalyzersetup') -- local
require('fluttertoolssetup') -- local
require('shadesetup') --local
require("telescope").load_extension "harpoon"
require("telescope").load_extension "file_browser"
require('lualine').setup()
EOF
