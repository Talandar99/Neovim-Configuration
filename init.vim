
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
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
	" For vsnip users.
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
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
	" Git
	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'
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
	set undodir=~/AppData/Local/nvim-data/backup
	set undofile
	set incsearch
	set tabstop=2
	set softtabstop=0 noexpandtab
	set shiftwidth=2
	"set colorcolumn=120
	set clipboard=unnamedplus
	set backspace=indent,eol,start
	set updatetime=300
	"set signcolumn=yes
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
	let g:lightline = {'colorscheme': 'tokyonight'}
	let	g:tokyonight_style = "night"
	colorscheme tokyonight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	let mapleader=" "
	"Flutter
 	nnoremap <leader>fd :FlutterDevices<CR>
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
	nnoremap <leader>wq :bufdo wq!<CR> 
	nnoremap <leader>wf :w!<CR> 
	nnoremap <leader>wa :wa!<CR>	

	"paste and don't save previous option
	xnoremap <leader>p "_d1hp
  "Trigger Translation
	nnoremap <Leader>tr <cmd>Pantran engine=google<CR> 
  
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
	nnoremap <leader>w :lua require("harpoon.mark").add_file()<CR> 
	nnoremap <leader>ee :lua require("harpoon.ui").toggle_quick_menu()<CR>
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
	"Git
	nmap gq <cmd>0G<CR>
	nmap gpl :Git pull
	nmap gps :Git push
	nmap gfe :Git fetch
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

	" Expand
	imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
	smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

  map <Left> <Esc>:echo 'you are weak'<CR>
  map <Right> <Esc>:echo 'you are weak'<CR>
  map <Up> <Esc>:echo 'you are weak'<CR>
  map <Down> <Esc>:echo 'you are weak'<CR>
  map <PageUp> <Esc>:echo 'you are weak'<CR>
  map <PageDown> <Esc>:echo 'you are weak'<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set completeopt=menu,menuone,noselect
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
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
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
      { name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      } },
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

require('rust-tools').setup{capabilities = capabilities}
require("flutter-tools").setup {
  ui = {
    border = "rounded",
    notification_style = 'plugin'
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  closing_tags = {
    highlight = "Comment", 
		prefix = "// ", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_tools = {
    autostart = true, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = false,
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = true, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■■color■■", -- the virtual text character to highlight
    },
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
			renameFilesWithClasses = "prompt", -- "always"
			enableSnippets = true,
		},
  }
}

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
	require("telescope").load_extension "harpoon"
	require("telescope").load_extension "file_browser"
	require('lualine').setup()
	
	require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})
EOF
