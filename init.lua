local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end
--autoformating for config
--lua vim.lsp.buf.format()
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'    -- Package manager
	use 'tpope/vim-surround'        --surround
	use 'jiangmiao/auto-pairs'      --Auto Pairs
	use 'matze/vim-move'            --lines movement
	use 'chrisbra/Colorizer'        --Colors highlight
	use 'andweeb/presence.nvim'     --Discord pressence
	use 'potamides/pantran.nvim'    --Translation in fly
	use 'nvim-lualine/lualine.nvim' --bottom bar
	use 'folke/tokyonight.nvim'     --tokyonight theme
	use 'kyazdani42/nvim-web-devicons' --icons in your statusline
	use 'startup-nvim/startup.nvim' --startup
	use {                           -- LSP + MASON
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig", }
	use {
		'jay-babu/mason-nvim-dap.nvim',
		'mfussenegger/nvim-dap-python',
		{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }, } -- dap
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-vsnip' --vsnip
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use 'Neevash/awesome-flutter-snippets' --Dart/Flutter
	use 'akinsho/flutter-tools.nvim'
	use 'dart-lang/dart-vim-plugin'
	use 'mhinz/vim-mix-format'             --Elixir
	use 'simrat39/rust-tools.nvim'         --Rust
	use 'rust-lang/rust.vim'
	use 'mhinz/vim-signify'                --Signify
	use 'tpope/vim-fugitive'               --fugitive
	use 'idanarye/vim-merginal'            --Branch management
	use 'sindrets/diffview.nvim'           --Solving merge conflicts
	use "lukas-reineke/indent-blankline.nvim" -- indent blankline
	use 'ThePrimeagen/harpoon'             --Harpoon
	use 'ThePrimeagen/vim-be-good'         --Vim Be good
	use 'mechatroner/rainbow_csv'          --csv rainbow colors
	use "henry-hsieh/riscv-asm-vim"        --riscv-asm syntax
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use 'nvim-telescope/telescope-file-browser.nvim'
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } } -- Telescope
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
	use { 'nvim-treesitter/nvim-treesitter', run = function()                                      -- Highlight, edit, and navigate code
		pcall(require('nvim-treesitter.install').update { with_sync = true })
	end, }
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', } -- Additional text objects via treesitter
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({
				ui = {
					theme = "round", -- Currently, only the round theme exists
					title = true, -- This option only works in Neovim 0.9
					border = "rounded", -- Border type can be single, double, rounded, solid, shadow.
					winblend = 0,
					expand = "",
					collapse = "",
					preview = " ",
					code_action = "",
					diagnostic = "🐞",
					incoming = " ",
					outgoing = " ",
					colors = {
						normal_bg = "",
						title_bg = "#9ece6a",
						red = "#f7768e",
						magenta = "#bb9af7",
						orange = "#ff9e64",
						yellow = "#e0af68",
						green = "#9ece6a",
						cyan = "#2ac3de",
						blue = "#7aa2f7",
						purple = "#bb9af7",
						white = "#cfc9c2",
						black = "#414868",
					},
					kind = {},
				},
			})
		end,
		requires = { { "nvim-tree/nvim-web-devicons" } }
	})
	if is_bootstrap then require('packer').sync() end
end)
if is_bootstrap then
	print '=================================='
	print '    useins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '       and type :MasonUpdate'
	print '=================================='
	return
end
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]] -- Autoformat on save


require("indent_blankline").setup({ show_current_context = true, show_current_context_start = true, })
require("telescope").load_extension "file_browser"
require("telescope").load_extension "harpoon"
require("startup").setup({ theme = "talandar" }) -- put theme name here
require('initial_setup')                         -- local
require('key_mappings')                          -- local
require('mason_config')                          -- local
require('lsp_servers')                           -- local
require('cmpsetup')                              -- local
require('lsp_floating_window_border')            -- local
require('treesitter_config')                     -- local
require('theme_config') 						 -- local
require('discord_presence')                      -- local
require('format_xml')                            -- local
