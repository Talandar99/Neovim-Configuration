require("flutter-tools").setup {
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
