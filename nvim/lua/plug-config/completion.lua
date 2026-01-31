local cmp = require("cmp")

local luasnip = require("luasnip")
local luasnip_loader = require("luasnip.loaders.from_vscode")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Esc>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer", option = { keyword_length = 5 } },
		{ name = "luasnip" },
		{ name = "path" },
	}),
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})

-- luasnip.filetype_extend("java", { "java-testing" })

luasnip_loader.lazy_load({
	includes = {
		"python",
		"javascript",
		"csharp",
		"lua",
		"shell",
		"html",
		"css",
		"kubernetes",
		"markdown",
	},
})

luasnip_loader.lazy_load({
	paths = {
		"~/.config/nvim/snippets/java",
		vim.fn.glob("~/.vscode/extensions/wesleyegberto.vscode-java-tests-*", 1),
		vim.fn.glob("~/.vscode/extensions/wesleyegberto.vscode-java-cloud-native-*", 1),
		vim.fn.glob("~/.vscode/extensions/wesleyegberto.vscode-java-spring-devtools-*", 1),
		vim.fn.glob("~/.vscode/extensions/wesleyegberto.globalpoints-snippets-*", 1),
		vim.fn.glob("~/.vscode/extensions/jorgeserrano.vscode-csharp-snippets-*", 1),
		vim.fn.glob("~/.vscode/extensions/johnpapa.angular2-*", 1),
		vim.fn.glob("~/.vscode/extensions/mikael.angular-beastcode-*", 1),
		vim.fn.glob("~/.vscode/extensions/lunuan.kubernetes-templates-*", 1),
	},
})

vim.cmd([[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])

-- === AI completion ===
-- Copilot
vim.b.copilot_enabled = true

if vim.b.copilot_enabled then
	vim.g.copilot_no_tab_map = true

	vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

	-- vim.cmd([[
	--   let g:copilot_filetypes = {
	--     \ '*': v:false,
	--     \ 'python': v:true,
	--     \ 'lua': v:true,
	--     \ 'java': v:true,
	--     \ 'javascript': v:true,
	--     \ 'typescript': v:true,
	--     \ 'csharp': v:true,
	--     \ 'shell': v:true,
	--     \ }
	-- ]])
end

-- Augument
vim.g.augment_disable_completions = false
-- vim.g.augment_disable_tab_mapping = true -- until fix C-y mapping

-- Sidekick
if vim.g.sidekick_nes ~= false then
	local sidekick = require("sidekick")

	sidekick.setup({
		cli = {
			mux = {
				enabled = false,
				backend = "tmux",
			},
			win = {
				keys = {
					stopinsert = { "<esc>", "stopinsert", mode = "t" }, -- enter normal mode
					hide_n = { "q", "hide", mode = "n" }, -- hide from normal mode
					win_c = { "<c-w>c", "hide" }, -- hide from terminal mode
					win_p = { "<c-w>p", "blur" }, -- leave the cli window
					win_w = { "<c-w>w", "blur" }, -- leave the cli window
					blur = { "<c-o>", "blur" }, -- leave the cli window
					prompt = { "<c-p>", "prompt" }, -- insert prompt or context
				},
			},
		},
	})

	-- smart next edit suggestion
	vim.keymap.set("n", "<Tab>", function()
		if not require("sidekick").nes_jump_or_apply() then
			return "<Tab>"
		end
	end)
end

-- 99
local _99 = require("99")

local cwd = vim.uv.cwd()
local basename = vim.fs.basename(cwd)

_99.setup({
	logger = {
		level = _99.DEBUG,
		path = "/tmp/" .. basename .. ".99.debug",
		print_on_error = true,
	},
	model = "github-copilot/gpt-4o",
	--- A new feature that is centered around tags
	completion = {
		--- A list of folders where you have your own SKILL.md
		--- Expected format:
		--- /path/to/dir/<skill_name>/SKILL.md
		custom_rules = {
      "projects/github/personal/tools/gemini-cli-tools/skills/"
		},
		source = "cmp",
	},

	--- md_files is a list of files to look for and auto add based on the location
	md_files = {
		"AGENTS.md",
	},
})
vim.keymap.set("n", "<leader>acl", function()
	_99.view_logs()
end, { desc = "99: View Logs" })

vim.keymap.set("n", "<leader>acp", function()
	_99.visual_prompt()
end, { desc = "99: Custom prompt" })

vim.keymap.set("v", "<leader>acp", function()
	_99.visual_prompt()
end, { desc = "99: Custom prompt" })

vim.keymap.set("n", "<leader>acf", function()
	_99.fill_in_function_prompt()
end, { desc = "99: Fill in function with prompt" })
vim.keymap.set("n", "<leader>acF", function()
	_99.fill_in_function()
end, { desc = "99: Fill in function" })

vim.keymap.set("v", "<leader>acf", function()
	_99.fill_in_function_prompt()
end, { desc = "99: Fill in function with prompt" })
vim.keymap.set("v", "<leader>acF", function()
	_99.visual()
end, { desc = "99: Fill in function" })

vim.keymap.set("v", "<leader>acS", function()
	_99.stop_all_requests()
end, { desc = "99: Stop all requests" })

