vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.cmd(
	[[
set clipboard=unnamedplus
set completeopt=menu,menuone,noselect
set relativenumber
set number
set signcolumn=yes
syntax on
set t_Co=256
set cursorline
set splitbelow
set encoding=UTF-8
set noerrorbells                                              	
set nowrap
set nobackup
set nowritebackup
set noswapfile
set nohlsearch
set smartcase
set undodir=~/.nvim-data/backup
set undofile
set incsearch
set softtabstop=0 noexpandtab
set tabstop=3
set shiftwidth=3
set backspace=indent,eol,start
set updatetime=50
set termguicolors
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
let g:vimwiki_list = [{'path': '~/.vimwiki/','syntax': 'markdown', 'ext': '.md'}]
let g:lightline = {'colorscheme': 'tokyonight'}
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
]]
)
