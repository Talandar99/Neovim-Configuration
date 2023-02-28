-- some things
require('rustanalyzersetup') -- local
require('fluttertoolssetup') -- local
require('lspconfig').html.setup { capabilities = capabilities }
require('lspconfig').lua_ls.setup({ capabilities = capabilities })
require('lspconfig').clangd.setup{}
require('lspconfig').bashls.setup { capabilities = capabilities }
require('rust-tools').setup { capabilities = capabilities }
require('lspconfig').pylsp.setup {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { 'W391' },
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
