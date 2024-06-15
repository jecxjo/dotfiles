local M = {}

M.fn = vim.fn
M.exec = vim.api.nvim_exec
M.api = vim.api
M.autocmd = vim.api.nvim_create_autocmd
M.set = vim.opt
M.cmd = vim.cmd
M.g = vim.g

function M.filetype_autocmd(filetype, cmd, params)
    M.autocmd("FileType", { pattern = filetype, command = cmd .. ' ' .. params })
end

function M.buffer_autocmd(pattern, cmd, params)
    M.autocmd("BufRead", { pattern = pattern, command = cmd .. ' ' .. params })
end

function M.hold_autocmd(pattern, cmd)
    M.autocmd("CursorHold", { pattern = pattern, command = cmd })
end

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = false }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.noremap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

return M
