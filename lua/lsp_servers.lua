require('lspconfig').rust_analyzer.setup({
capabilities = capabilities,
on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
		}
})
require("flutter-tools").setup {
	capabilities =capabilities,
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
require('lspconfig').html.setup { capabilities = capabilities }
require('lspconfig').lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
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
require('lspconfig').phpactor.setup{}
require('lspconfig').intelephense.setup({
		settings = {
				intelephense = {
						stubs = { 
								"bcmath",
								"bz2",
								"calendar",
								"Core",
								"curl",
								"zip",
								"zlib",
								"wordpress",
								"woocommerce",
								"acf-pro",
								"wordpress-globals",
								"wp-cli",
								"genesis",
								"polylang"
						},
						environment = {
							includePaths = '/home/your-user/.composer/vendor/php-stubs/' -- this line forces the composer path for the stubs in case inteliphense don't find it...
						},
						files = {
								maxSize = 5000000;
						};
				};
		}
})

