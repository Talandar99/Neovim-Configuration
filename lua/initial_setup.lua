vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.syntax = 'on'
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.encoding = 'UTF-8'
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.g.rust_cargo_check_all_targets = 1
vim.g.rustfmt_autosave = 1
vim.g.dart_format_on_save = 1
vim.g.dartfmt_options = {'--fix', '--line-length 120'}
vim.g.signify_sign_add = '+'
vim.g.signify_sign_delete = '_'
vim.g.signify_sign_delete_first_line = '‾'
vim.g.signify_sign_change = '~'
vim.g.signify_disable_by_default = 1
vim.g.signify_sign_show_count = 0
vim.g.signify_sign_show_text = 1

vim.o.compatible = false
vim.cmd('filetype plugin on')
vim.g.lightline = {colorscheme = 'tokyonight'}
vim.g.LanguageClient_serverCommands = {
  sh = {'bash-language-server', 'start'}
}
vim.g.mix_format_on_save = 1
vim.g.mix_format_silent_errors = 1

vim.cmd([[
set undodir=~/.nvim-data/backup
set undofile
]]
)
