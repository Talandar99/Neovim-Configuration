function FormatXml()
    if vim.bo.filetype == 'xml' then
        vim.api.nvim_command('%!xmllint --format --encode utf-8 -')
        vim.api.nvim_command('%s/  /    /g')
    else
        vim.api.nvim_echo({ { "The current buffer is not an XML file", "WarningMsg" } }, true, {})
    end
end

vim.cmd('command! FXML lua FormatXml()')
