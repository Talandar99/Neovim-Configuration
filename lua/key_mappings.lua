vim.cmd([[
"leader 
let mapleader=" "

"work in progress <merge tool>
"nmap gds :Gvdiffsplit!<CR>
nnoremap <leader>ds :DiffviewOpen<CR>

"-- TOGGLES --
"colorizer
nnoremap <leader>tc <cmd>ColorToggle<CR>
"signify
nmap <leader>ts :SignifyToggle<CR> 
nmap <leader>th :SignifyToggleHighlight<CR>
"Git Merginal
nmap <leader>tm :MerginalToggle<CR>
"harpoon
nnoremap <leader>te :lua require("harpoon.ui").toggle_quick_menu()<CR>
"Trigger Translation
nnoremap <Leader>tp <cmd>Pantran source=pl engine=google<CR> 
nnoremap <Leader>tu <cmd>Pantran source=en target=pl engine=google<CR> 
"-- TOGGLES --

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

"Git fugitive
nmap gq <cmd>0G<CR>
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
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover({border = "rounded"})<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

"automaticly center after C-d C-u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"Dont use arrows
map <Left> <Esc>:echo 'embrace vim'<CR>
map <Right> <Esc>:echo 'you are weak'<CR>
map <Up> <Esc>:echo 'never slow down'<CR>
map <Down> <Esc>:echo 'you don't need arrows<CR>
]])
