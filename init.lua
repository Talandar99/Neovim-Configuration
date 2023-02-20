-- Packer autoinstalation
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

-- lua vim.lsp.buf.formatting_sync() --autoformating

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use 'tpope/vim-surround' --surround
	use 'jiangmiao/auto-pairs' --Auto Pairs
	use 'matze/vim-move' -- lines movement
	use 'chrisbra/Colorizer' --Colors highlight
	use 'andweeb/presence.nvim' --Discord pressence
	use 'potamides/pantran.nvim' --Translation in fly
	use 'nvim-lualine/lualine.nvim' --bottom bar
	use 'folke/tokyonight.nvim' --tokyonight theme
	use 'kyazdani42/nvim-web-devicons' --icons in your statusline
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'startup-nvim/startup.nvim' --startup
	use 'ThePrimeagen/harpoon' --Harpoon
	use { -- LSP + MASON
    	"williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",}
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip' --vsnip
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use 'bash-lsp/bash-language-server' --Bash
	use 'Neevash/awesome-flutter-snippets' --Dart/Flutter
	use 'dart-lang/dart-vim-plugin'
	use 'akinsho/flutter-tools.nvim'
	use 'mhinz/vim-mix-format' --Elixir
	use 'elixir-lsp/elixir-ls'
	use 'simrat39/rust-tools.nvim' --Rust
	use 'rust-lang/rust.vim'
	use 'mhinz/vim-signify' --Signify
	use 'tpope/vim-fugitive' --fugitive
	use 'tpope/vim-rhubarb'
	use 'junegunn/gv.vim'
	use 'idanarye/vim-merginal' --Branch management
	use 'sindrets/diffview.nvim' --Solving merge conflicts
	use 'python-lsp/python-lsp-server' -- python ls
--	use 'haskell/haskell-language-server' -- haskell ls
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({
				ui = {
					theme = "round", -- Currently, only the round theme exists
					title = true, -- This option only works in Neovim 0.9
					border = "rounded",-- Border type can be single, double, rounded, solid, shadow.
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
	use "lukas-reineke/indent-blankline.nvim" -- indent blankline
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } } -- Telescope
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
	use { 'nvim-treesitter/nvim-treesitter', run = function() -- Highlight, edit, and navigate code
		pcall(require('nvim-treesitter.install').update { with_sync = true })
	end, }
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', } -- Additional text objects via treesitter
	if is_bootstrap then require('packer').sync() end
end)
if is_bootstrap then
	print '=================================='
	print '    useins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
require("indent_blankline").setup {
	show_current_context = true,
	show_current_context_start = true,
}
require('initial_setup') --local
require('key_mappings') --local
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls"},
})
require("lspconfig").lua_ls.setup{ capabilities=capabilities }
require('rust-tools').setup { capabilities = capabilities }
require("telescope").load_extension "file_browser"
require("telescope").load_extension "harpoon"
require("startup").setup({ theme = "talandar" }) -- put theme name here
require('lspconfig').bashls.setup { capabilities = capabilities }
require('lspconfig').html.setup { capabilities = capabilities }
require('php_setup') -- local
require('rustanalyzersetup') -- local
require('fluttertoolssetup') -- local
require('lspconfig')['hls'].setup{
	filetypes = { 'haskell', 'lhaskell', 'cabal' },
}
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}
require('lspconfig').elixirls.setup {
	capabilities = capabilities,
	cmd = { "/home/talandar/.config/nvim/elixir-ls/language_server.sh" },
	settings = {
		elixirLS = {
			dialyzerEnabled = false,
			fetchDeps = false
		}
	}
} -- (for elixir lsp to work properly change talandar to yout user name)
require('cmpsetup') -- local
require('lsp_floating_window_border') --local
-- mason setup
require('treesitter_config') -- local
require('tokyonightsetup') -- local
require("presence"):setup({
	auto_update        = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
	neovim_image_text  = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
	main_image         = "neovim", -- Main image display (either "neovim" or "file")
	client_id          = "793271441293967371", -- Use your own Discord application client id (not recommended)
	log_level          = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
	debounce_timeout   = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
	enable_line_number = false, -- Displays the current line number instead of the current project
	blacklist          = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
	buttons            = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
	file_assets        = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
	show_time          = true, -- Show the timer
	editing_text        = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
	file_explorer_text  = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
	git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
	plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	reading_text        = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
	workspace_text      = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
	line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
