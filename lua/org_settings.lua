-- conceal is used to hide elements when in normal mode
vim.opt.conceallevel = 2
--
require('orgmode').setup({
    org_agenda_files = { '~/workspace/notes/*' },
    org_default_notes_file = '~/workspace/notes/001_notes.org',
    org_agenda_span = 'month', --default time span that is showed when open agenda
    win_split_mode = { 'float', 0.8 },
    win_border = 'rounded',
    org_hide_emphasis_markers = true, -- hide things like bold,italic etc
    org_time_stamp_rounding_minutes = 1,
    org_capture_templates = {
        c = {
            description = 'Calendar event',
            template = '* %?\n  %^t',
            target = '~/workspace/notes/002_calendar.org',
        }
    },
})


require("org-bullets").setup({
    concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
    symbols = {
        -- list symbol
        list = "•",
        -- or false to disable the symbol. Works for all symbols
        checkboxes = {
            half = { "-", "OrgTSCheckboxHalfChecked" },
            done = { "X", "OrgDone" },
            todo = { " ", "OrgTODO" },
        },

    }
})
