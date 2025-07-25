local map = vim.api.nvim_set_keymap

local home = os.getenv('HOME')
local dotfiles = os.getenv('DOTFILES')

vim.cmd [[
  setlocal shiftwidth=4
  setlocal softtabstop=4
  setlocal tabstop=4
  setlocal noexpandtab

  setlocal path=.,src/main/java/**,src/test/java/**,**/src/main/java/**,**/src/test/java/**
  setlocal include=^\s*import
  setlocal includeexpr=substitute(v:fname,'\\.','/','g')
]]

require('telescope').load_extension('langtools')
require('telescope._extensions.langtools').setup({ language = 'java' })

local function setup_keymaps()
  local opts = { noremap = true }

  -- langtools
  map('n', '<Leader>pm', ':Telescope langtools picker<CR>', opts)
  map('n', '<Leader>pc', ':Telescope langtools clean<CR>', opts)
  map('n', '<Leader>pb', ':Telescope langtools build<CR>', opts)
  map('n', '<Leader>pp', ':Telescope langtools package<CR>', opts)
  map('n', '<Leader>pta', ':Telescope langtools test<CR>', opts)
  map('n', '<Leader>ptf', ':Telescope langtools test_file<CR>', opts)
  map('n', '<Leader>ptl', ':Telescope langtools test_last_file<CR>', opts)

  -- source
  map('n', '<Leader>cso', '<cmd>lua require"jdtls".organize_imports()<CR>', opts)

  -- refactoring
  map('n', '<Leader>crm', '<cmd>lua require"jdtls".extract_method()<CR>', opts)
  map('v', '<Leader>crm', '<cmd>lua require"jdtls".extract_method(true)<CR>', opts)
  map('n', '<Leader>crv', '<cmd>lua require"jdtls".extract_variable()<CR>', opts)
  map('v', '<Leader>crv', '<cmd>lua require"jdtls".extract_variable(true)<CR>', opts)
  map('n', '<Leader>crc', '<cmd>lua require"jdtls".extract_constant()<CR>', opts)
  map('v', '<Leader>crc', '<cmd>lua require"jdtls".extract_constant(true)<CR>', opts)

  -- test
  map('n', '<Leader>rtd', '<cmd>lua require"jdtls".test_class()<CR>', opts) -- debug
  map('n', '<Leader>rtc', '<cmd>lua require"jdtls".test_class()<CR>', opts)
  map('v', '<Leader>rtm', '<cmd>lua require"jdtls".pick_test()<CR>', opts)
  map('n', '<Leader>rtn', '<cmd>lua require"jdtls".test_nearest_method()<CR>', opts)
  map('n', '<Leader>dl', '<cmd>lua require"dap".run_last()<CR>', opts)
  map('n', '<Leader>ds', '<cmd>lua require"dap".terminate()<CR>', opts)

  -- debug
  map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
  map('n', '<S-F5>', '<cmd>lua require"dap".terminate()<CR>', opts)
  map('n', '<F17>', '<cmd>lua require"dap".terminate()<CR>', opts)
  map('n', '<F7>', '<cmd>lua require"dap".run_to_cursor()<CR>', opts)
  map('n', '<F8>', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
  map('n', '<F9>', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
  map('n', '<S-F9>', '<cmd>lua require"dap".clear_breakpoints()<CR>', opts)
  map('n', '<F21>', '<cmd>lua require"dap".clear_breakpoints()<CR>', opts)
  map('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', opts)
  map('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', opts)
  map('n', '<S-F11>', '<cmd>lua require"dap".step_out()<CR>', opts)
  map('n', '<F23>', '<cmd>lua require"dap".step_out()<CR>', opts)
  map('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', opts)

  -- debug view (conf https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt)
  map('n', '<Leader>dv', '<cmd>lua require"dapui".toggle()<CR>', opts) -- toggle ui
  map('n', '<Leader>dt', '<cmd>lua require"dap".repl.open()<CR>', opts) -- toggle repl
  map('n', '<Leader>de', '<cmd>lua require"dapui".eval()<CR>', opts) -- eval expression

  map('n', '<Leader>dp', '<cmd>lua require"dap.ui.widgets".preview()<CR>', opts)
  map('v', '<Leader>dp', '<cmd>lua require"dap.ui.widgets".preview()<CR>', opts)
  map('n', '<Leader>dh', '<cmd>lua require"dap.ui.widgets".hover()<CR>', opts)
  map('v', '<Leader>dh', '<cmd>lua require"dap.ui.widgets".hover()<CR>', opts)
  vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end)
  vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
  end)
end

local jdtls = require('jdtls')

local function setup_dap()
  local dap = require('dap')
  local dapui = require('dapui')

  dapui.setup()
  jdtls.setup_dap({ hotcodereplace = 'auto' })
  require("nvim-dap-virtual-text").setup({
    virt_text_win_col = 80,
    highlight_changed_variables = true,
    display_callback = function(variable, _buf, _stackframe, _node)
      return '  🔍 ' .. variable.name .. ' = ' .. variable.value
    end
  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
  vim.fn.sign_define('DapStopped', {text='🐛', texthl='', linehl='', numhl=''})
  vim.fn.sign_define('DapLogPoint', {text='❔', texthl='', linehl='', numhl=''})
  vim.fn.sign_define('DapBreakpointRejected', {text='🤡', texthl='', linehl='', numhl=''})

  require('jdtls.dap').setup_dap_main_class_configs()
end

local devtools_dir = home .. "/dev-tools/ide"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/workspace/' .. project_name

local config
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local bundles = {
  -- config for debug tool
  vim.fn.glob(devtools_dir .. '/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', 1),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(devtools_dir .. '/vscode-java-test/server/*.jar', 1), '\n'))
vim.list_extend(bundles, vim.split(vim.fn.glob(devtools_dir .. '/vscode-java-decompiler/server/*.jar', 1), '\n'))


-- Dowload JDTLS at https://download.eclipse.org/jdtls/milestones/?d
config = {
  cmd = {
    'java', -- or '/path/to/java17/bin/java'
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- v1.9.0 (JDK 17)
    -- '-jar', vim.fn.glob(devtools_dir .. '/jdt-language-server/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_*.jar'),
    -- '-configuration', devtools_dir .. '/jdt-language-server/jdt-language-server-1.9.0-202203031534/config_mac',
    -- v1.47.0 (JDK 21)
    '-jar', vim.fn.glob(devtools_dir .. '/jdt-language-server/jdt-language-server-1.47.0-202505151856/plugins/org.eclipse.equinox.launcher_*.jar', 1),
    '-configuration', devtools_dir .. '/jdt-language-server/jdt-language-server-1.47.0-202505151856/config_mac',
    '-data', workspace_dir,
  },
  root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', 'pom.xml'}, { upward = true })[1]),
  ['java.format.settings.url'] = dotfiles .. "/ide/eclipse_formatter.xml",
  ['java.format.settings.profile'] = "Java",
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
          "java.util.stream.Collectors.*"
        }
      },
      configuration = {
        runtimes = {
          -- {
          --   name = 'JavaSE-8',
          --   path = home .. '/.jabba/jdk/zulujdk@8/Contents/Home'
          -- },
          {
            name = 'JavaSE-11',
            path = home .. '/.jabba/jdk/microsoft@11.0/Contents/Home'
          },
          {
            name = 'JavaSE-17',
            path = home .. '/.jabba/jdk/openjdk@17.0.2/Contents/Home'
          },
          {
            name = 'JavaSE-21',
            path = home .. '/.jabba/jdk/openjdk@21/Contents/Home',
            default = true
          }
        }
      }
    }
  },
  capabilities = {
    workspace = {
      configuration = true
    },
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  init_options = {
    extendedClientCapabilities = extendedClientCapabilities,
    bundles = bundles,
    workspace = {
      library = {
        globalLibrary = {
          location = home .. '/.jabba/jdk/openjdk@21/Contents/Home',
          name = 'OpenJDK 21'
        }
      }
    }
  },
  on_attach = function()
    setup_dap()

    jdtls.setup.add_commands()
    vim.cmd [[
      augroup lsp_jdtls
        command! -buffer -nargs=? -complete=custom,v:lua.require('jdtls')._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
        command! -buffer -nargs=? -complete=custom,v:lua.require('jdtls')._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
        command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
        command! -buffer JdtBytecode lua require('jdtls').javap()
        command! -buffer JdtJshell lua require('jdtls').jshell()
      augroup END
    ]]

    setup_keymaps()
  end,
  on_init = function(client, _)
    client.notify('workspace/didChangeConfiguration', { settings = config.settings })
  end
}

jdtls.start_or_attach(config)

