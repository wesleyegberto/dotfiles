local function run_action(option)
  vim.api.nvim_command(
    string.format(
      [[:FloatermNew --autoclose=1 --title='%s' %s]], option.text, option.action
    )
  )
end

return { run_action = run_action }