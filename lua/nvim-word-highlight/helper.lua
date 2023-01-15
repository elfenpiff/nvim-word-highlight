local M = {}

function M.extract_from_current_line(matcher)
    local cursor = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
    local content_len = string.len(content)
    local reverse_content = string.reverse(content)

    local word_start = string.find(reverse_content, matcher, content_len - cursor)
    local word_end = string.find(content, matcher, cursor + 1)

    if word_start == nil
    then
        word_start = 0
    else
        word_start = content_len - word_start + 2
    end

    if word_end == nil
    then
        word_end = content_len
    else
        word_end = word_end - 1
    end

    local word = {
            value = string.sub(content, word_start, word_end),
            value_end = word_end,
    }

    return word
end

function M.does_path_exist(path)
    local f = io.open(path, "r")
    if f ~= nil
    then
        io.close(f)
        return true
    else
        return false
    end
end

function M.is_valid_path(path)
    if path == nil or path == "." or path == ".."
    then
        return false
    end

    local pos = string.find(path, '[^%/]')
    if pos ~= nil
    then
        return true
    else
        return false
    end
end

return M
