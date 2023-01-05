
function write_buffer(data)
  vim.cmd('vsplit')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_set_current_win(win)

  vim.api.nvim_buf_set_lines(buf, 0, -1, true, data)
end

local attach_to_buffer = function(output_bufnr, pattern, command)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('buf-write-post', { clear = true }),
    pattern = pattern,
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
      end

      vim.fn.jobstart(command, {
        stdout_buffered = false,
        on_stdout = append_data,
        on_stderr = append_data
      })
    end
  })
end

-- local buf_num = vim.api.nvim_get_current_buf()

vim.api.nvim_create_user_command('AutoRun', function()
  print 'AutoRun starts now'
  local bufnr = vim.api.nvim_get_current_buf()
  local pattern = '*.lua'
  -- local command = vim.split(vim.fn.input 'Command:', ' ')
  local filename = vim.api.nvim_buf_get_name(0)
  local command = { 'luac', filename }

  attach_to_buffer(bufnr, pattern, command)
end, {})
