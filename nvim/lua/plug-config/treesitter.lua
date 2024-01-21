require('nvim-treesitter.configs').setup({
    -- nvim-treesitter/nvim-treesitter (self config)
    ensure_installed = { 'java', 'python', 'c_sharp', 'typescript', 'javascript', 'lua', 'html', 'markdown', 'markdown_inline' },
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = { 'yaml' }
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<Leader>si',
            node_incremental = '<Leader>sn',
            node_decremental = '<Leader>sN',
            scope_incremental = '<Leader>sc',
        },
    },
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
                ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',

                -- Or you can define your own textobjects like this
                -- ["iF"] = {
                --     python = "(function_definition) @function",
                --     cpp = "(function_definition) @function",
                --     c = "(function_definition) @function",
                --     java = "(method_declaration) @function",
                -- },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader><M-a>'] = '@parameter.inner',
                ['<leader><M-f>'] = '@function.outer',
                ['<leader><M-e>'] = '@element',
            },
            swap_previous = {
                ['<leader><M-A>'] = '@parameter.inner',
                ['<leader><M-F>'] = '@function.outer',
                ['<leader><M-E>'] = '@element',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']f'] = '@function.outer',
                [']]'] = '@class.outer',
                ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                [']F'] = '@function.outer',
                [']['] = '@class.outer',
                ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[['] = '@class.outer',
                ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
                ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
            },
            goto_previous_end = {
                ['[F'] = '@function.outer',
                ['[]'] = '@class.outer',
                ["[S"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
                ["[Z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
            },
        },
    },
    -- windwp/nvim-ts-autotag
    autotag = {
        enable = true,
    },
    -- andymass/matchup.vim
    matchup = {
        enable = true,
        disable = {},
        disable_virtual_text = false
    },
    -- nvim-treesitter/playground
    playground = {
        enable = false,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
    },
    -- nvim-treesitter/nvim-treesitter-refactor
    refactor = {
        highlight_definitions = { enable = true },
        -- highlight_current_scope = { enable = false },
    },
})

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

local opts = { noremap = true, silent=true }

vim.api.nvim_set_keymap('n', '<Leader>sf', ':lua require("tsht").nodes()<CR>', opts)
vim.api.nvim_set_keymap('v', '<Leader>sf', ':lua require("tsht").nodes()<CR>', opts)

-- code folding
require('ufo').setup({
    open_fold_hl_timeout = 250,
    close_fold_kinds = {'imports', 'comment'},
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end,
    preview = {
        win_config = {
            -- border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    }
})

require('nvim-ts-autotag').setup()

