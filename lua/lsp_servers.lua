capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason-nvim-dap").setup({
    automatic_setup = true,
    ensure_installed = { "python", "rust" }
})
--autoformat
require("lsp-format").setup {}
local on_attach = function(client)
    require("lsp-format").on_attach(client)
end
--paths
local lsp_servers_path = vim.fn.stdpath "data" .. "/lsp_servers/"
local elixirls_path = lsp_servers_path .. "elixir-ls/language_server.sh"
local codelldb_root = lsp_servers_path .. "codelldb/extension/"
local debugpy_path = lsp_servers_path .. "debugpy/venv/bin/python"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"
--dap setup
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
--dap rust
dap.adapters.rust = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
--dap python
require('dap-python').setup(debugpy_path)
-- rust lsp
require('rust-tools').setup({
    on_attach = on_attach,
    capabilities = capabilities,
    tools = {
        -- rust-tools options
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
    on_attach = on_attach,
    capabilities = capabilities,
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
        prefix = "<-- ", -- character to use for close tag e.g. > Widget
        enabled = true   -- set to false to disable
    },
    dev_tools = {
        autostart = true,          -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
    },
    outline = {
        open_cmd = "30vnew",  -- command to use to open the outline buffer
        auto_open = false     -- if true this will open the outline automatically when it is first populated
    },
    flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
    fvm = false,              -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
    widget_guides = {
        enabled = false,
    },
    lsp = {
        color = {
            -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = false, -- highlight the background
            foreground = true, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■■color■■", -- the virtual text character to highlight
        },
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
                vim.fn.expand '$HOME/.pub-cache',
                -- vim.fn.expand '$HOME/fvm/versions', -- flutter-tools should automatically exclude your SDK.
                "<path-to-flutter-sdk-packages>"
            },
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
        },
    }
}
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig').clangd.setup { capabilities = capabilities }
require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig').gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 120
                }
            }
        }
    }
}
require('lspconfig').elixirls.setup {
    --remember to install hex package manager with
    --mix local.hex
    --chmod +x language_server.sh
    --also helps
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { elixirls_path },
    settings = {
        elixirLS = {
            dialyzerEnabled = false,
            fetchDeps = false
        }
    }
}
require('lspconfig').phpactor.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig').intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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
                includePaths =
                '/home/your-user/.composer/vendor/php-stubs/' -- this line forces the composer path for the stubs in case inteliphense don't find it...
            },
            files = {
                maxSize = 5000000,
            },
        },
    }
})

require('lspconfig').jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
-- web
--
require('lspconfig').elmls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig').tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
vim.g.LanguageClient_serverCommands = {
    sh = { 'bash-language-server', 'start' }
}
require('lspconfig').dartls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
