-- === glepnir/galaxyline.nvim ===

local gl = require('galaxyline')
local gls = gl.section

-- separators: "┃", "▋", "█", "", "", "", "", "", "", "", "●"

gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#282c34',
  lightbg = '#4d5163',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#0087d7',
  red = '#ec5f67'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function()
        return "▋"
    end,
    highlight = {colors.blue, colors.blue}
  }
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        V = "VISUAL",
        [""] = "VISUAL",
        v = "VISUAL",
        R = "REPLACE"
      }
      local current_Mode = alias[vim.fn.mode()]

      if current_Mode == nil then
        return "  Terminal "
      else
        return "  " .. current_Mode .. " "
      end
    end,
    separator = '',
    separator_highlight = {colors.darkblue, colors.lightbg},
    highlight = {colors.blue, colors.lightbg}
  }
}

-- file
gls.left[3] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {colors.grey, colors.darkblue},
  },
}
gls.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.lightbg, colors.darkblue},
    highlight = {colors.grey, colors.darkblue}
  }
}

-- git branch
gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty,
    highlight = {colors.red,colors.lightbg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    separator = ' ',
    separator_highlight = {colors.lightbg, colors.lightbg},
    highlight = {colors.red, colors.lightbg},
  }
}

-- git status
local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end
gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green, colors.lightbg},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange, colors.lightbg},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red, colors.lightbg},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.bg, colors.lightbg},
    highlight = {colors.lightbg, colors.lightbg}
  }
}

-- LSP status
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red, colors.bg}
  }
}
gls.left[12] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange, colors.bg},
  }
}

-- no content
gls.left[13] = {
  Space = {
    provider = function() return ' ' end,
    highlight = {colors.bg, colors.bg}
  }
}

-- file format
gls.right[1] = {
  file_format_icon = {
    provider = function()
      return " "
    end,
    separator = "",
    separator_highlight = {colors.red, colors.bg},
    highlight = {colors.lightbg, colors.red}
  }
}
gls.right[2] = {
  FileFormat = {
    provider = {'FileSize','FileEncode'},
    separator = ' ',
    separator_highlight = {colors.lightbg, colors.lightbg},
    highlight = {colors.red, colors.lightbg},
  }
}

-- cursor position
gls.right[3] = {
  position_icon = {
    provider = function()
      return " "
    end,
    separator = " ",
    separator_highlight = {colors.green, colors.lightbg},
    highlight = {colors.lightbg, colors.green}
  }
}
gls.right[4] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {colors.lightbg, colors.lightbg},
    highlight = {colors.green, colors.lightbg},
  },
}

-- percentage
gls.right[5] = {
  percentage_icon = {
    provider = function()
      return " "
    end,
    separator = "",
    separator_highlight = {colors.blue, colors.lightbg},
    highlight = {colors.lightbg, colors.blue}
  }
}
gls.right[6] = {
  line_percentage = {
    -- provider = 'LinePercent',
    provider = function()
      local current_line = vim.fn.line(".")
      local total_line = vim.fn.line("$")

      if current_line == 1 then
          return "  Top "
      elseif current_line == vim.fn.line("$") then
          return "  Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return "  " .. result .. "% "
    end,
    highlight = {colors.blue, colors.lightbg}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}
