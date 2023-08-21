require("mason").setup({
    ui = {
        border = "single",
        icons = {
            package_installed = "✅",
            package_pending = "🔨",
            package_uninstalled = "📦"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = {
        'lua_ls',
    },
})
require('mason-tool-installer').setup {
    ensure_installed = {
        { 'bash-language-server',        auto_update = true },
        { 'shellcheck',                  auto_update = true },
        -- duplicate ? ^
        { 'lua-language-server',         auto_update = true },
        { 'jdtls',                       auto_update = true },
        { "codelldb",                    auto_update = true },
        { "debugpy",                     auto_update = true },
        { "lua-language-server",         auto_update = true },
        { "python-lsp-server",           auto_update = true },
        { "rust-analyzer",               auto_update = true },
        { "elixir-ls",                   auto_update = true },
        { "gopls",                       auto_update = true },
        { "html-lsp",                    auto_update = true },
        { "elm-format",                  auto_update = true },
        { "elm-language-server",         auto_update = true },
        { "typescript-language-server",  auto_update = true },
        { 'tailwindcss-language-server', auto_update = true },
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
    debounce_hours = 5, -- at least 5 hours between attempts to install/update
}
