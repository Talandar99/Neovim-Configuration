require("mason-nvim-dap").setup({
	automatic_setup = true,
	ensure_installed = { "python", "rust" }
})
--dap rust
require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
local mason_registry = require("mason-registry")
local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"
dap.adapters.rust = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
-- rust lsp
require('rust-tools').setup({
  tools = { -- rust-tools options
    executor = require("rust-tools.executors").termopen,
    on_initialized = nil,
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      auto = true,
      only_current_line = false,
      show_parameter_hints = true,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    hover_actions = {
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      max_width = nil,
      max_height = nil,
      auto_focus = false,
    },
    crate_graph = {
      backend = "x11",
      output = nil,
      full = true,
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },
  server = {
    standalone = true,
  }, -- rust-analyzer options
	dap = { adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path) },
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
require('lspconfig').tailwindcss.setup{}
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
