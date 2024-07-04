require('orgmode').setup({
    org_agenda_files = { '~/.org/*' },
    org_default_notes_file = '~/.org/org_notes.org',
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
