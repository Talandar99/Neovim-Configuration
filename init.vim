	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"Plugins
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
	"Debuger 	
	Plug 'puremourning/vimspector'
	
	"Rust 
	Plug 'rust-lang/rust.vim'
	"Dart
	Plug 'dart-lang/dart-vim-plugin'
	"Typescript
	Plug 'ianks/vim-tsx'
	Plug 'leafgarland/typescript-vim'
	
	"COC
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	" File and folder management
	" NERDTree
	Plug 'ryanoasis/vim-devicons'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	"telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	"lines movement
	Plug 'fedepujol/move.nvim'
	" Snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'natebosch/dartlang-snippets'
	" Language support
	Plug 'tpope/vim-projectionist'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jiangmiao/auto-pairs'
	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'
	" Theme
	Plug 'folke/tokyonight.nvim'

call plug#end()
	







	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"Settings
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	colorscheme tokyonight
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
	"highlight ColorColumn ctermbg=0 guibg=lightgrey
	"coc config
	let g:coc_global_extensions = [
	  \ 'coc-snippets',
	  \ 'coc-tsserver',
	  \ 'coc-eslint', 
	  \ 'coc-prettier', 
	  \ 'coc-json', 
	  \ 'coc-flutter',
	  \ 'coc-snippets',
	  \ 'coc-yaml',
	  \ 'coc-tslint-plugin',
	  \ 'coc-tsserver',
	  \ 'coc-emmet',
	  \ 'coc-css',
	  \ 'coc-html',
	  \ 'coc-json',
	  \ ]
	let g:rust_cargo_check_all_targets = 1
	let g:NERDTreeGitStatusWithFlags = 1
	
	" == AUTOCMD ================================ 
	" by default .ts file are not identified as typescript and .tsx files are not
	" identified as typescript react file, so add following
	au BufNewFile,BufRead *.ts setlocal filetype=typescript
	au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
	" == AUTOCMD END ================================
	




	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"Key mappings
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	let mapleader=" "
	"Flutter
	nnoremap <leader>fe :CocCommand flutter.emulators <CR>
 	nnoremap <leader>fd :below new output:///flutter-dev <CR>
	nnoremap <leader>fr :CocCommand flutter.run <CR>
	"Rust
	nnoremap <leader>cb :Cargo build <CR>
	nnoremap <leader>cc :Cargo check <CR>
	nnoremap <leader>cr :Cargo run <CR>
	"quit
	nnoremap <leader>q :q <CR>
	nnoremap <leader>wq :wq!<CR> 

	"open telescope (close have same binding)
	nnoremap <C-c> :Telescope find_files<CR>

	map <leader>h :wincmd h <CR>
	map <leader>j :wincmd j <CR>
	map <leader>k :wincmd k <CR>
	map <leader>l :wincmd l <CR>

	"split jumping
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	"moving lines
	nnoremap <silent> <A-j> :MoveLine(1)<CR>
	nnoremap <silent> <A-k> :MoveLine(-1)<CR>
	vnoremap <silent> <A-j> :MoveBlock(1)<CR>
	vnoremap <silent> <A-k> :MoveBlock(-1)<CR>
	nnoremap <silent> <A-l> :MoveHChar(1)<CR>
	nnoremap <silent> <A-h> :MoveHChar(-1)<CR>
	vnoremap <silent> <A-l> :MoveHBlock(1)<CR>
	vnoremap <silent> <A-h> :MoveHBlock(-1)<CR>
	nnoremap <C-b> :NERDTreeToggle<CR>

	"autosave options
	let g:rustfmt_autosave = 1
	let g:dart_format_on_save = 1
	let g:dartfmt_options = ['--fix', '--line-length 120']
	
	" Coc
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	
	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)
	
	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
	    execute 'h '.expand('<cword>')
	  elseif (coc#rpc#ready())
	    call CocActionAsync('doHover')
	  else
	    execute '!' . &keywordprg . " " . expand('<cword>')
	  endif
	endfunction
	
	"Git
	nmap <leader>gs :G<CR>
	nmap <leader>gh :diffget //2<CR>
	nmap <leader>gl :diffget //3<CR>
	
	imap <tab> <Plug>(coc-snippets-expand)
	let g:UltiSnipsExpandTrigger = '<Nop>'
	let g:coc_snippet_next = '<TAB>'
	let g:coc_snippet_prev = '<S-TAB>'
	
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	
	" Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
	
	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a <Plug>(coc-codeaction-selected)<CR>
	nmap <leader>a <Plug>(coc-codeaction-selected)<CR>
	

