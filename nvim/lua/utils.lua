-- utils.lua
-- source: https://icyphox.sh/blog/nvim-lua/

local M = {}
local cmd = vim.cmd

function M.create_augroup(name, autocmds)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

function M.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

function M.isempty(s)
  return s == nil or s == ''
end

return M
