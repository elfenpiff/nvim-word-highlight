local helper = require("nvim-word-highlight.helper")

local M = {}

function M.highlight_word_under_cursor()
    cursor = vim.api.nvim_win_get_cursor(0)[2]
    line = vim.api.nvim_win_get_cursor(0)[1]
    content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
    content_len = string.len(content)
    reverse_content = string.reverse(content)

    local path = helper.extract_from_current_line('[^a-zA-Z0-9_%-%.%/]').value

    if helper.is_valid_path(path) and helper.does_path_exist(path)
    then
        local epath = string.gsub(path, '%/', "\\%/")
        vim.cmd("exec 'match' 'FileHighlight' '/" .. epath .."/'")
    else
        local word = helper.extract_from_current_line('[^a-zA-Z0-9_]').value
        vim.cmd("exec 'match' 'WordHighlight' '/" .. word .."/'")
    end
end

function M.open_path_under_cursor()
    local path = helper.extract_from_current_line('[^a-zA-Z0-9_%-%.%/]')
    -- local line, cur = string.match(content, ':(%d+):(%d+)', path.value_end)
    local line = string.match(content, ':(%d+)', path.value_end)

    if helper.is_valid_path(path) and helper.does_path_exist(path.value)
    then
        if line ~= nil
        then
            vim.cmd("e +" .. line .. " " .. path.value)
        else
            vim.cmd("e " .. path.value)
        end
    end
end

return M
