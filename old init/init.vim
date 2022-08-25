set number

call plug#begin()
	"Debuger 	
	Plug 'puremourning/vimspector'

	"Rust base 
	Plug 'rust-lang/rust.vim'

	" Use release branch (recommend)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Or build from source code by using yarn: https://yarnpkg.com
	" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	
	" File and folder management
	" NERDTree
	Plug 'ryanoasis/vim-devicons'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" Snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'natebosch/dartlang-snippets'
	" Language support
	Plug 'tpope/vim-projectionist'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jiangmiao/auto-pairs'
	" Dart
	Plug 'dart-lang/dart-vim-plugin'
	" Typescript
	Plug 'ianks/vim-tsx'
	Plug 'leafgarland/typescript-vim'
	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'


" Theme
"Plug 'EdenEast/nightfox.nvim' 
"Plug 'jacoborus/tender.vim'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
"Plug 'arcticicestudio/nord-vim'
"Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim'

call plug#end()
	"colorscheme nightfox
	"colorscheme tender
	"colorscheme onehalfdark
	"colorscheme nord
	colorscheme tokyonight


	set termguicolors
	syntax on
	set t_Co=256
	set cursorline
	let g:airline_theme='onehalfdark'

  set splitbelow
	set encoding=UTF-8
	set noerrorbells                                              " Don't add sounds for errors
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
	"
	
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

	map <leader>h :wincmd h <CR>
	map <leader>j :wincmd j <CR>
	map <leader>k :wincmd k <CR>
	map <leader>l :wincmd l <CR>

	"split jumping
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	nnoremap <C-b> :NERDTreeToggle<CR>
	" nnoremap <C-S-b> :NERDTreeFind<CR>
	
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
	
	nmap <C-P> :FZF<CR>
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
