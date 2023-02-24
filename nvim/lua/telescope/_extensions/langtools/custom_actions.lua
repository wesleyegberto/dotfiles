local has_floaterm = vim.api.nvim_eval('exists(":Floaterm")')
local has_toggleterm = vim.api.nvim_eval('exists(":Floaterm")')

local function run_floaterm(command, title)
  vim.api.nvim_command(
    string.format(
      [[:FloatermNew --autoclose=1 --title='%s' %s]], title, command
    )
  )
end

local function run_toggleterm(command, title)
  local Terminal = require('toggleterm.terminal').Terminal
  local run_term = Terminal:new({
    cmd = command,
    direction = 'horizontal',
    close_on_exit = false,
  })
  run_term:toggle()
end

local function run_vimterm(command, title)
  vim.api.nvim_command(
    string.format(
      [[:vnew term://%s | setlocal nobuflisted]], command
    )
  )
end

local function run_action(option)
  local command = option.action
  if option.format_args ~= nil then
    command = command .. option.format_args()
  end
  -- require'custom/utils'.dump(command)
  if has_floaterm then
    run_floaterm(command, option.text)
  elseif has_toggleterm then
    run_toggleterm(command, option.text)
  else
    run_vimterm(command, option.text)
  end
end

return { run_action = run_action }
