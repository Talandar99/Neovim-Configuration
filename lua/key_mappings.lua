vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>M', "<cmd>Mason<CR>", { desc = 'run Mason' })
vim.keymap.set('n', '<leader>E', vim.cmd.Ex, { desc = 'native filesearch' })
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set('n', '<leader>ct', "<cmd>ColorToggle<CR>", { desc = 'toggle colorizer' })
--quit
vim.keymap.set('n', '<leader>q', "<cmd>q<CR>", { desc = 'quit' })
vim.keymap.set('n', '<leader>wq', "<cmd>bufdo wq!<CR>", { desc = 'write everything and quit' })
vim.keymap.set('n', '<leader>aa', "<cmd>wa!<CR>", { desc = 'write' })
--harpoon
local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

vim.keymap.set('n', '<A-=>', harpoon_mark.add_file, { desc = 'add file to harpoon menu' })
vim.keymap.set('n', '<A-->', harpoon_ui.toggle_quick_menu, { desc = 'open harpoon menu' })
vim.keymap.set('n', '<A-1>', function() harpoon_ui.nav_file(1) end, { desc = 'harpoon go to 1st mark' })
vim.keymap.set('n', '<A-2>', function() harpoon_ui.nav_file(2) end, { desc = 'harpoon go to 2nd mark' })
vim.keymap.set('n', '<A-3>', function() harpoon_ui.nav_file(3) end, { desc = 'harpoon go to 3th mark' })
vim.keymap.set('n', '<A-4>', function() harpoon_ui.nav_file(4) end, { desc = 'harpoon go to 4th mark' })
vim.keymap.set('n', '<A-5>', function() harpoon_ui.nav_file(5) end, { desc = 'harpoon go to 5th mark' })
vim.keymap.set('n', '<A-6>', function() harpoon_ui.nav_file(6) end, { desc = 'harpoon go to 6th mark' })
vim.keymap.set('n', '<A-7>', function() harpoon_ui.nav_file(7) end, { desc = 'harpoon go to 7th mark' })
vim.keymap.set('n', '<A-8>', function() harpoon_ui.nav_file(8) end, { desc = 'harpoon go to 8th mark' })
vim.keymap.set('n', '<A-9>', function() harpoon_ui.nav_file(9) end, { desc = 'harpoon go to 9th mark' })
vim.keymap.set('n', '<leader>tp', ':lua require("harpoon.term").gotoTerminal(1)<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tu', ':lua require("harpoon.term").gotoTerminal(2)<CR>', { noremap = true })
--signify
vim.keymap.set('n', '<leader>ts', '<cmd>SignifyToggle<CR>', { desc = 'toggle signify' })
vim.keymap.set('n', '<leader>th', '<cmd>SignifyToggle<CR>', { desc = 'toggle highlight' })
-- open telescope (close have same binding)
vim.keymap.set('n', '<leader><leader>', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true })
-- split jumping
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true })
-- moving lines
vim.keymap.set('n', '<A-j>', ':lua require("move").move_line(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':lua require("move").move_line(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ':lua require("move").move_block(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ':lua require("move").move_block(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ':lua require("move").move_hchar(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', ':lua require("move").move_hchar(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-l>', ':lua require("move").move_hblock(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-h>', ':lua require("move").move_hblock(-1)<CR>', { noremap = true, silent = true })
-- automatically center after C-d C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
-- Don't use arrows
vim.keymap.set('n', '<Left>', ':echo "embrace vim"<CR>', { noremap = true })
vim.keymap.set('n', '<Right>', ':echo "you are weak"<CR>', { noremap = true })
vim.keymap.set('n', '<Up>', ':echo "never slow down"<CR>', { noremap = true })
vim.keymap.set('n', '<Down>', ':echo "you dont need this..."<CR>', { noremap = true })
-- vimscript
vim.cmd([[
"paste and don't save previous option
xnoremap <leader>p "_d1hp
"Git fugitive
nmap gps :Git push
nmap gpl :Git pull
nmap gfc :Git fetch
nmap grh :Git reset --hard
nmap gbl :Git blame<CR>
"open git
nmap <leader>gg <cmd>0G<CR>
"Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
"Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
]])
--Lspsaga
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
--keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>") --rename in project , Require testing
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
-- Show line diagnostics You can pass argument ++unfocus to unfocus the show_line_diagnostics floating window
vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostics
vim.keymap.set("n", "<leader>sd", "<cmd>Lspsaga show_buf_diagnostics<CR>")
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.keymap.set("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
--terminal
vim.keymap.set({ "n", "t" }, "<leader>T", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set({ "t" }, "<leader>q", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'enter command mode in termianl' })
--debuging
vim.keymap.set("n", '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set("n", '<F10>', function() require('dap').continue() end)
vim.keymap.set("n", '<F11>', function() require('dap').step_into() end)
vim.keymap.set("n", '<F12>', function() require('dap').step_over() end)
--automaticly add debuger shortkey if file is rust file
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.rs",
    callback = function()
        vim.keymap.set("n", '<F5>', '<cmd>RustDebuggables<CR>')
    end,
})
--automaticly add debuger shortkey if file is python file
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.py",
    callback = function()
        vim.keymap.set("n", '<F5>', function() require('dap').continue() end)
    end,
})
--automaticly format file using ClangFormat if it's C file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.c",
    callback = function()
        vim.api.nvim_command("ClangFormat")
    end,
})
