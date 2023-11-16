local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end
require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'               --Package manager
        use 'jiangmiao/auto-pairs'                 --Auto Pairs
        use 'startup-nvim/startup.nvim'            --startup
        use 'matze/vim-move'                       --lines movement
        use 'chrisbra/Colorizer'                   --Colors highlight
        use 'andweeb/presence.nvim'                --Discord pressence
        use 'nvim-lualine/lualine.nvim'            --bottom bar
        use 'folke/tokyonight.nvim'                --tokyonight theme
        use 'kyazdani42/nvim-web-devicons'         --icons in your statusline
        use 'neovim/nvim-lspconfig'
        use 'williamboman/mason-lspconfig.nvim'
        use 'williamboman/mason.nvim'
        use 'WhoIsSethDaniel/mason-tool-installer.nvim'
        use 'lukas-reineke/lsp-format.nvim'
        use 'mfussenegger/nvim-dap'
        use 'mfussenegger/nvim-dap-python'
        use 'jay-babu/mason-nvim-dap.nvim'
        use 'rcarriga/nvim-dap-ui'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
        use 'akinsho/flutter-tools.nvim'
        use 'Neevash/awesome-flutter-snippets'                                 --Dart/Flutter
        use 'mhinz/vim-mix-format'                                             --Elixir
        use 'mhinz/vim-signify'                                                --Signify
        use 'simrat39/rust-tools.nvim'                                         --Rust
        use 'rust-lang/rust.vim'
        use 'sindrets/diffview.nvim'                                           --Solving merge conflicts
        use { 'lukas-reineke/indent-blankline.nvim', tag = "v2.20.8" }         --Indent blankline guides
        use 'ThePrimeagen/harpoon'                                             --Harpoon
        use 'mechatroner/rainbow_csv'                                          --csv rainbow colors
        use 'stevearc/oil.nvim'                                                --oil file explorer
        use 'tpope/vim-surround'                                               --surround
        use 'tpope/vim-fugitive'                                               --fugitive
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use { 'nvim-treesitter/nvim-treesitter', run = function()         -- Highlight, edit, and navigate code
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end, }
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function() require(".lspsaga_setup") end,             --local
        })

        if is_bootstrap then require('packer').sync() end
    end,
    config = { clone_timeout = false }
})
if is_bootstrap then
    print '=================================='
    print '       Bootstraping packer'
    print '=================================='
    print 'Just let him finish...'
    print 'to install everything just type'
    print ':PackerInstall'
    print 'and'
    print ':MasonUpdate'
    print '=================================='
    return
end
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})
