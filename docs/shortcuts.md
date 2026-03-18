# Shortcuts & Keybindings Reference

> Complete reference for all keybindings, aliases, and utility functions configured in the development environment.

## Table of Contents

- [Terminal (Ghostty)](#terminal-ghostty)
- [Tmux](#tmux)
  - [Prefix & Config](#prefix--config)
  - [Sessions](#sessions)
  - [Windows](#windows)
  - [Panes](#panes)
  - [Copy Mode](#copy-mode)
  - [Tools (Popups)](#tools-popups)
- [Neovim](#neovim)
  - [Leader Key & Modes](#leader-key--modes)
  - [Files & Buffers](#files--buffers)
  - [Navigation & Motion](#navigation--motion)
  - [Marks & Jumps](#marks--jumps)
  - [Windows & Splits](#windows--splits)
  - [Tabs & Buffers Navigation](#tabs--buffers-navigation)
  - [Search & Telescope](#search--telescope)
  - [Folding](#folding)
  - [Motion Plugins (Hop)](#motion-plugins-hop)
  - [File Tree (nvim-tree)](#file-tree-nvim-tree)
  - [Harpoon](#harpoon)
  - [Git](#git)
  - [LSP](#lsp)
  - [Code Actions & Refactor](#code-actions--refactor)
  - [Tests & Project](#tests--project)
  - [Debug](#debug)
  - [Java (jdtls)](#java-jdtls)
  - [Omnisharp (.NET)](#omnisharp-net)
  - [Multiple Cursors](#multiple-cursors)
  - [Vim-Surround](#vim-surround)
  - [Snippets](#snippets)
  - [Treesitter Navigation](#treesitter-navigation)
  - [Startify](#startify)
  - [Misc](#misc)
- [VS Code](#vs-code)
  - [Sidebar & Views](#sidebar--views)
  - [Code Navigation](#code-navigation)
  - [Panels & Groups](#panels--groups)
  - [Integrated Terminal](#integrated-terminal)
  - [Editing](#editing)
- [Terminal (ZSH)](#terminal-zsh)
  - [Aliases - Navigation](#aliases---navigation)
  - [Aliases - Git](#aliases---git)
  - [Aliases - Git Sub-commands](#aliases---git-sub-commands)
  - [Aliases - AI Assist](#aliases---ai-assist)
  - [Aliases - Tmux](#aliases---tmux)
  - [Aliases - Kubernetes](#aliases---kubernetes)
  - [Aliases - Docker](#aliases---docker)
  - [Aliases - System](#aliases---system)
  - [FZF Bindings](#fzf-bindings)
  - [Functions - Tmux](#functions---tmux)
  - [Functions - Finders](#functions---finders)
  - [Functions - Git](#functions---git)
  - [Functions - Projects](#functions---projects)
  - [Functions - Containers & Kubernetes](#functions---containers--kubernetes)
  - [Functions - AWS](#functions---aws)
  - [Functions - Utilities](#functions---utilities)
- [Aerospace (Window Manager)](#aerospace-window-manager)
  - [Workspaces](#workspaces)
  - [Window Focus](#window-focus)
  - [Move Windows](#move-windows)
  - [Monitors](#monitors)
  - [Layout & Resize](#layout--resize)
  - [Special Modes](#special-modes)
  - [Apps Mode](#apps-mode)
- [Rectangle (Window Snapping)](#rectangle-window-snapping)
- [Keyboard (QMK - YMDK SP64)](#keyboard-qmk---ymdk-sp64)

---

## Terminal (Ghostty)

**Leader key:** `C-a`

### Tabs & Windows

| Shortcut | Action |
|----------|--------|
| `C-S-l` | Cycle window layout |
| `<Leader>c` | Create new tab |
| `<Leader>\|` / `<Leader>-` | New window aside (vertical / horizontal) |
| `<Leader>C` | New window |
| `<Leader>shift+.` | Move window to the right |
| `<Leader>shift+,` | Move window to the left |
| `<Leader>x` | Close window |
| `<Leader>d` | Close tab |
| `<Leader>,` | Rename tab |
| `<Leader>#` | Go to tab by index |

### Pane Resize

| Shortcut | Action |
|----------|--------|
| `<Leader>S-j` | Resize pane down |
| `<Leader>S-k` | Resize pane up |
| `<Leader>S-h` | Resize pane left |
| `<Leader>S-l` | Resize pane right |

### Misc

| Shortcut | Action |
|----------|--------|
| `C-S-Delete` / `Cmd-A-r` | Clear terminal |
| `C-S-a>m` | Increase background opacity |
| `C-S-a>l` | Decrease background opacity |
| `C-S-a>d` | Reset background opacity |
| `C-S-a>1` | Full background opacity |

---

## Tmux

**Config:** `tmux/.tmux.conf`

### Prefix & Config

| Key | Action |
|-----|--------|
| `C-b` | **Prefix key** |
| `C-b C-r` | Reload tmux config |
| `C-b ?` | Show key bindings (help) |

---

### Sessions

| Shortcut | Action |
|----------|--------|
| `C-b C-c` | New session |
| `C-b $` | Rename session |
| `C-b C-f` | Find session (prompt) |
| `C-b s` | Choose session (tree view) |
| `C-b C-m` | Menu to choose session |
| `C-b d` | Detach from session |
| `C-b )` / `C-b (` | Next / previous session |
| `C-b S-l` / `C-b C-l` | Go to last active session |

---

### Windows

| Shortcut | Action |
|----------|--------|
| `C-b c` | New window (retains cwd) |
| `C-b <` | Window menu |
| `C-b ,` | Rename window |
| `C-b w` | Choose window |
| `C-b n` / `C-b p` | Next / previous window |
| `C-b #` | Jump to window by index |
| `C-b l` | Go to last active window |
| `C-b X` | Kill window |

---

### Panes

| Shortcut | Action |
|----------|--------|
| `C-b v` / `C-b \|` | Vertical split |
| `C-b s` / `C-b -` | Horizontal split |
| `C-b >` | Pane menu |
| `C-b ;` | Go to last active pane |
| `C-b o` | Go to next pane |
| `C-b {` / `C-b }` | Move pane left / right |
| `C-b +` | Zoom pane |
| `C-b C-<Arrow>` | Resize pane |
| `C-b H/J/K/L` | Resize pane by 5 cols/rows |
| `C-b q` | Show pane numbers |
| `C-b q <number>` | Select pane by number |
| `C-b <Space>` | Toggle pane layouts |
| `C-b !` | Convert pane to new window |
| `C-b x` | Close pane |
| `C-h/j/k/l` (copy mode) | Select pane |
| `C-\` (copy mode) | Select last active pane |

---

### Copy Mode

| Shortcut | Action |
|----------|--------|
| `C-b [` | Enter copy mode (VI keys) |
| `v` | Begin selection |
| `y` | Copy selection → pbcopy |
| `C-b C-p` | Choose buffer to paste |

---

### Tools (Popups)

| Shortcut | Action |
|----------|--------|
| `C-b C-h` | Open current directory in Finder |
| `C-b C-t` | Open TODO.md in nvim (split) |
| `C-b C-g` | Lazygit in popup |
| `C-b C-v` | Neovim in popup |
| `C-b C-s` | VS Code in popup |
| `C-b C-i` | AI CLI (Gemini) in popup |

---

## Neovim

**Config:** `nvim/lua/config/keybindings.lua` | Plugin configs in `nvim/lua/plugins/`

### Leader Key & Modes

| Key | Description |
|-----|-------------|
| `Space` | **Leader key** |
| `jk` (insert) | Exit insert mode → normal |

---

### Files & Buffers

| Shortcut | Mode | Action |
|----------|------|--------|
| `<D-s>` / `<C-s>` | N/I/V | Save buffer |
| `<Leader>bf` | N | Fuzzy buffer finder |
| `<Leader>bp` | N | Previous buffer |
| `<Leader>bn` | N | Next buffer |
| `<Leader>bl` | N | Last buffer |
| `<Leader>bd` | N | Delete buffer |
| `<Leader>bk` | N | Wipeout buffer |
| `<Leader>ow` | N | Toggle word wrap |

---

### Navigation & Motion

| Shortcut | Mode | Action |
|----------|------|--------|
| `H` | N | Start of line (`^`) |
| `L` | N | End of line (`$`) |
| `k` / `j` | N | Navigate with wrap (gk/gj) |
| `n` / `N` | N | Centered search result + unfold |
| `*` | N | Search without moving cursor |
| `#` | N | Jump to previous occurrence |
| `[i` | N | Show first occurrence of current word |
| `[I` | N | Show all occurrences of current word |
| `J` | N | Join lines keeping cursor position |
| `Y` | N | Yank to end of line |
| `U` | N | Redo |
| `<M-j>` / `<M-k>` (∆/˚) | N/I/V | Move line(s) down/up |
| `<M-Up>` / `<M-Down>` | N | Move current line above/below |
| `[<Space>` / `]<Space>` | N | Add blank line before/after |
| `dD` | N/V | Delete without copying |
| `p` / `P` | V | Paste over selection without yanking |
| `gV` | N | Reselect last pasted/changed text |
| `$` | V | Go to last char before EOL |
| `<` / `>` | V | Indent keeping selection |
| `j` / `k` (count > 5) | N | Add to jumplist |
| `<C-h/j/k/l>` | I | Move cursor in insert mode |
| `<C-a>` / `<C-e>` | I | Start / end of line (insert) |
| `<C-h/j/k/l/a/e>` | CMD | Same movements in command mode |
| `<Leader><Esc>` | N | Clear search highlight |
| `;` | N | Add semicolon at end of line |
| `g;` / `g.` | N | Last / next edition position |
| `%` | N | Jump to matching bracket |
| `{` / `}` | N | Previous / next paragraph |
| `[/` / `]/` | N | Comment block start / end |
| `[m` / `]m` | N | Start of previous / next function body |
| `[M` / `]M` | N | End of previous / next function body |
| `[%` / `]%` | N | Previous / next enclosing bracket |
| `[{` / `]}` | N | Enclosing `{` / `}` |
| `[(` / `])` | N | Enclosing `(` / `)` |

---

### Marks & Jumps

| Shortcut | Mode | Action |
|----------|------|--------|
| `` `^ `` | N | Last cursor position in insert mode |
| `` `. `` | N | Last change in current buffer |
| `` `< `` | N | Beginning of last visual selection |
| `` `> `` | N | End of last visual selection |
| `` `[ `` | N | Beginning of last changed/yanked text |
| `` `] `` | N | End of last changed/yanked text |
| `C-^` | N | Go to last buffer |

---

### Windows & Splits

| Shortcut | Mode | Action |
|----------|------|--------|
| `<C-w>s` / `<Leader>ws` | N | Split horizontally |
| `<C-w>v` / `<Leader>wv` | N | Split vertically |
| `<C-w>m` | N | Maximize window |
| `<C-w>c` / `<C-w>q` / `<Leader>wc` | N | Close current window |
| `<Leader>wd` | N | Close current buffer |
| `<C-w>#<` / `<C-w>#>` | N | Shrink / grow window by # |
| `<C-w>x` | N | Flip windows |
| `<Leader>wfh` | N | Flip split: vertical → horizontal |
| `<Leader>wfv` | N | Flip split: horizontal → vertical |
| `<C-w>H` / `<C-w>L` | N | Move panel left / right |
| `<C-w>J` / `<C-w>K` | N | Move panel down / up |
| `<C-w>w` | N | Jump to next window |
| `<C-w><Arrow>` | N | Jump to adjacent window |
| `<C-\>` | N | Go to previous window |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | N | Navigate windows left/down/up/right |

---

### Tabs & Buffers Navigation

| Shortcut | Mode | Action |
|----------|------|--------|
| `gt` / `gT` | N | Next / previous tab |
| `#gt` | N | Go to tab at index # |
| `gb` / `]b` | N | Next buffer |
| `gB` / `[b` | N | Previous buffer |
| `<M-Right>` / `<M-Left>` | N | Cycle buffers |
| `<C-tab>` / `<C-m>` | N | Buffer switcher (JABS) |

---

### Search & Telescope

> Telescope prefix: `<Leader>f` | FZF prefix: `<Leader>F`

| Shortcut | Mode | Action |
|----------|------|--------|
| `<C-p>` | N | Find files (Telescope) |
| `<Leader>f_` | N | Open Telescope |
| `<Leader>f;` | N | Find command |
| `<Leader>f/` | N | Find command history |
| `<Leader>f?` | N | Find help tags |
| `<Leader>fw` | N | Find open windows |
| `<Leader>fe` | N | File explorer finder |
| `<Leader>ff` | N | Find file |
| `<Leader>fb` | N | Find buffer |
| `<Leader>fL` | N | Fuzzy find buffer content |
| `<Leader>fr` | N | Find with ripgrep |
| `<Leader>fgf` | N | Find file in git |
| `<Leader>fgs` | N | Find file in git changes |
| `<Leader>fgc` | N | Find git commit |
| `<Leader>fgC` | N | Find git commit in current buffer |
| `<Leader>fm` | N | Find mark |
| `<Leader>ft` | N | Find tag |
| `<Leader>fT` | N | Find tag in current buffer |
| `<Leader>fX` | N | Find tmux sessions |
| `<Leader>fS` | N | Find sessions |
| `<Leader>fP` | N | Find projects |

**Inside Telescope results:**

| Key | Action |
|-----|--------|
| `C-t` | Open in new tab |
| `C-x` | Open in horizontal split |
| `C-v` | Open in vertical split |

---

### Folding

| Shortcut | Mode | Action |
|----------|------|--------|
| `zh` | N | Peek folded lines or hover (nvim-ufo) |
| `zm` | N | Fold most inner open scope |
| `zM` | N | Fold all scopes |
| `zr` | N | Unfold most inner scope |
| `zR` | N | Unfold all scopes |

---

### Motion Plugins (Hop)

> Prefix: `<Leader><Leader>`

| Shortcut | Action |
|----------|--------|
| `<Leader><Leader>?` | Hop to word |
| `<Leader><Leader>f` | Hop char → forward |
| `<Leader><Leader>F` | Hop char → backward |
| `<Leader><Leader>c` | Hop 2 chars → forward |
| `<Leader><Leader>C` | Hop 2 chars → backward |
| `<Leader><Leader>w` | Hop word → forward |
| `<Leader><Leader>b` | Hop word → backward |
| `<Leader><Leader>l` | Hop to line |
| `<Leader><Leader>j` | Hop line start → down |
| `<Leader><Leader>k` | Hop line start → up |

---

### File Tree (nvim-tree)

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>e` | N | Toggle file tree |
| `<Leader>y` | N | Focus file tree |

**Inside nvim-tree:**

| Key | Action |
|-----|--------|
| `a` | Add file |
| `r` | Rename |
| `c` | Copy file |
| `x` | Cut file |
| `p` | Paste file |
| `d` | Delete |
| `y` | Copy file path |
| `Y` | Copy filename |
| `R` | Refresh |
| `h` / `gh` | Collapse folder / recursive |
| `l` / `gl` | Expand folder / recursive |
| `o` / `<CR>` | Toggle collapsed/expanded |
| `e` | Open file |
| `s` | Open in vertical split |
| `v` | Open in horizontal split |
| `.` | Toggle hidden files |
| `X` | Open with system defaults |
| `gf` | Go to source: file |
| `gb` | Go to source: buffer |
| `[d` / `]d` | Diagnostic prev / next |
| `[l` / `]l` | Previous / next location in list |
| `[c` / `]c` | Git prev / next |
| `<<` / `>>` | Git stage / unstage |

---

### Harpoon

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>mM` | N | Show quick menu |
| `<Leader>mt` | N | Toggle file |
| `<Leader>ma` | N | Add file |
| `<Leader>md` | N | Remove file |
| `<Leader>mC` | N | Clear all files |
| `<Leader>m#` | N | Go to file # |

---

### Git

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>gf` | N | Fetch |
| `<Leader>gp` | N | Pull |
| `<Leader>gr` | N | Rebase |
| `<Leader>gm` | N | Modified files |
| `<Leader>gs` | N | Diff status |
| `<Leader>gS` | N | Status |
| `<Leader>gc` | N | Commit |
| `<Leader>gP` | N | Push |
| `<Leader>gl` | N | Log |
| `<Leader>gb` | N | Blame inline |
| `<Leader>gB` | N | Blame view |
| `<Leader>gdf` | N | Diff current file |
| `<Leader>gdc` | N | Close diff view |
| `<Leader>gv` | N | Diff vertical split |
| `<Leader>gh` | N | Diff horizontal split |
| `[c` / `]c` | N | Previous / next git change |

---

### LSP

| Shortcut | Mode | Action |
|----------|------|--------|
| `<C-Space>` | I | Refresh autocomplete |
| `gd` | N | Go to definition |
| `gD` | N | Peek definition |
| `gi` | N | Go to implementation |
| `gI` | N | Peek implementation |
| `gt` | N | Go to type definition |
| `gr` | N | Find references |
| `glt` | N | Go to last run test |
| `gh` | N | Hover action |
| `[g` / `]g` | N | Previous / next diagnostic |
| `<Leader>cdl` | N | Show line diagnostics |
| `<Leader>cdp` | N | Show workspace diagnostics |
| `<Leader>cdt` | N | Show view diagnostics |
| `<Leader>ch` | N | Show documentation |
| `C-\` | I | Show documentation (insert mode) |
| `<Leader>cft` | N | Find workspace symbols |
| `<Leader>cfm` | N | Find members |
| `<Leader>cfi` | N | Find ingoing calls |
| `<Leader>cfo` | N | Find outgoing calls |

---

### Code Actions & Refactor

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>csf` | N/V | Format buffer / selection |
| `<Leader>crn` | N | Rename variable |
| `<Leader>cqf` | N | Quick fix |
| `<Leader>cal` | N | Code action for current line |
| `<Leader>cas` | V | Code action for selection |
| `<Leader>cam` | N | Code action menu with preview |
| `<Leader>sf` | N | Select treesitter node |

---

### Tests & Project

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>rta` | N | Run all tests |
| `<Leader>rtf` | N | Run file tests |
| `<Leader>rtl` | N | Run last test |
| `<Leader>pb` | N | Project build |
| `<Leader>pc` | N | Project clean |
| `<Leader>pp` | N | Project package |
| `<Leader>pta` | N | Project run all tests |
| `<Leader>ptf` | N | Project run tests from current file |

---

### Debug

| Shortcut | Mode | Action |
|----------|------|--------|
| `F5` | N | Continue / start debug |
| `S-F5` | N | Stop debug |
| `F9` | N | Toggle breakpoint |
| `S-F9` | N | Remove all breakpoints |
| `F10` | N | Step over |
| `F11` | N | Step into |
| `S-F11` / `F12` | N | Step out |
| `<Leader>dv` | N | Toggle debug view |
| `<Leader>dt` | N | Toggle REPL view |
| `<Leader>de` | V | Eval selected expression |
| `<Leader>dp` | V | View expression in preview window |
| `<Leader>dh` | V | View expression in float window |
| `<Leader>ds` | N | Show scopes |
| `<Leader>df` | N | Show frames |

---

### Java (jdtls)

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>cro` | N | Organize imports |
| `<Leader>crm` | N/V | Extract method |
| `<Leader>crv` | N/V | Extract variable |
| `<Leader>crc` | N/V | Extract constant |
| `<Leader>rtc` | N | Run test class |
| `<Leader>rtn` | N | Run nearest test method |

---

### Omnisharp (.NET)

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>clc` | N | Code check |
| `<Leader>cls` | N | Server start |
| `<Leader>clr` | N | Server restart |
| `<Leader>clp` | N | Server stop |

---

### Multiple Cursors

| Shortcut | Mode | Action |
|----------|------|--------|
| `<M-n>` | N | Start multicursor and select all matches |
| `<C-n>` | N | Start multicursor + add cursor on match |

**After `<C-n>`:**

| Key | Action |
|-----|--------|
| `<C-n>` | Add cursor on next match |
| `<C-x>` | Skip next match |
| `<C-p>` | Remove cursor and go back to previous match |

---

### Vim-Surround

> `{`, `(`, `[` → wraps with spaces | `}`, `)`, `]` → wraps without spaces

| Example | Action |
|---------|--------|
| `cs"'` | Replace surrounding `"` with `'` |
| `ds"` | Delete surrounding `"` |
| `yss)` | Wrap line with `()` |
| `yss}` | Wrap line with `{}` |
| `ysiw]` | Wrap current word (`iw`) with `]` |

Format: `cs<CHAR_TO_REPLACE><NEW_CHAR>`

---

### Snippets

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>cfs` | N | Find symbols |
| `<C-l>` | V | Cut selection for use inside snippet |
| `<C-n>` | I | Next snippet item |
| `<C-p>` | I | Previous snippet item |

---

### Treesitter Navigation

| Shortcut | Mode | Action |
|----------|------|--------|
| `]]` / `[[` | N | Next / previous element |
| `]f` / `[f` | N | Next / previous function |
| `]s` / `[s` | N | Next / previous scope |
| `]z` / `[z` | N | Next / previous fold |

---

### Startify

| Shortcut | Mode | Action |
|----------|------|--------|
| `<Leader>S;` | N | Show startify |
| `<Leader>Sf` | N | Find session |

---

### Misc

| Tip | Action |
|-----|--------|
| Select JSON + `:!jq` | Format JSON inline (replace selection with jq output) |

---

## VS Code

**Config:** `vscode/keybindings.json` | **Leader:** `Space`

### Sidebar & Views

> Prefix: `cmd+k`

| Shortcut | Action |
|----------|--------|
| `cmd+k cmd+b` | Toggle sidebar |
| `cmd+k cmd+shift+b` | Toggle auxiliary bar |
| `cmd+k cmd+e` | Toggle explorer |
| `cmd+k cmd+f` | Open search |
| `cmd+k cmd+g` | Source control (git) |
| `cmd+k cmd+l` | GitLens view |
| `cmd+k cmd+x` | Active extensions |
| `cmd+k cmd+m` | Bookmarks |
| `cmd+k cmd+n` | VS Notes |
| `cmd+k cmd+t` | Test view |
| `cmd+k cmd+c` | Collapse explorer / clear search |
| `space e` | Toggle explorer (context-aware) |

**In Explorer:**

| Key | Action |
|-----|--------|
| `a` / `cmd+n` | New file |
| `shift+a` / `shift+cmd+n` | New folder |
| `v` | Open to the side |
| `d` | Delete file |
| `r` | Rename file |
| `cmd+r` | Refresh explorer |

**Global:**

| Key | Action |
|-----|--------|
| `cmd+r` | Open Recent (outside explorer) |
| `cmd+k cmd+y` | Show active file in explorer |
| `cmd+k cmd+h` | Toggle testing peek history |
| `cmd+k cmd+p` | Open Markdown preview |
| `alt+cmd+n` | Open file (extension) |

---

### Code Navigation

| Shortcut | Action |
|----------|--------|
| `cmd+b` | Go to definition |
| `shift+cmd+b` | Go to implementation |
| `alt+b` | Peek definition |
| `shift+alt+b` | Peek implementation |
| `shift+cmd+i` | Format document |
| `ctrl+p` | Quick open files |
| `ctrl+o` | Navigate back |
| `ctrl+/` | Switch window |

---

### Panels & Groups

> Prefix: `ctrl+w`

| Shortcut | Action |
|----------|--------|
| `ctrl+h/j/k/l` | Navigate between panels left/down/up/right |
| `ctrl+n` | Next item in list |
| `ctrl+w x` | Toggle editor group layout |
| `ctrl+w shift+h/l/k/j` | Move editor to left/right/above/below group |
| `ctrl+w shift+r` / `ctrl+w r` | Move editor to previous/next group |
| `ctrl+w \` | Focus last editor group |
| `ctrl+w w` / `ctrl+w n` | Focus next group |
| `ctrl+w p` | Focus previous group |
| `ctrl+w shift+.` / `ctrl+w shift+,` | Increase/decrease view size |
| `ctrl+w shift+m` | Maximize editor |
| `ctrl+w c` | Close active editor |
| `ctrl+tab` / `ctrl+m` | Switch between recent editors |
| `ctrl+cmd+p` / `ctrl+b ctrl+b` | Open previous editor |
| `ctrl+cmd+p` (in picker) | Navigate to previous editor in picker |
| `ctrl+cmd+n` (in picker) | Navigate to next editor in picker |

---

### Integrated Terminal

> Prefix: `ctrl+b`

| Shortcut | Action |
|----------|--------|
| `cmd+j` / `F1` | Toggle terminal focus/panel |
| `F4` / `ctrl+b c` | New terminal |
| `ctrl+b x` | Kill terminal |
| `ctrl+b ,` | Rename terminal |
| `ctrl+b v` | Split terminal vertically |
| `ctrl+b shift+=` | Toggle maximized panel |
| `ctrl+b shift+.` / `ctrl+b shift+,` | Increase/decrease size |
| `ctrl+b n` / `ctrl+b p` | Next/previous terminal |
| `ctrl+b l` | Focus previous terminal (alternative) |
| `F3` / `F2` | Next/previous terminal |
| `ctrl+b o` | Focus next pane (split terminal) |
| `ctrl+b ;` | Focus previous pane (split terminal) |
| `ctrl+b 1-9` | Focus terminal by index |
| `ctrl+b ctrl+j/h/l/k` | Move group down/left/right/up |
| `ctrl+b ctrl+down/left/right/up` | Resize pane |
| `ctrl+l` | Clear terminal |

---

### Editing

| Shortcut | Action |
|----------|--------|
| `alt+j` / `alt+k` | Move line(s) down/up |
| `alt+cmd+j` / `alt+cmd+down` | Duplicate line(s) down |
| `alt+cmd+k` / `alt+cmd+up` | Duplicate line(s) up |
| `shift+alt+up` / `shift+alt+down` | Insert cursor above/below |
| `ctrl+shift+s` | Source action |
| `cmd+right` | Insert cursor at end of each selected line |
| `q` / `shift+q` | Move selection to next/previous match |

---

## Terminal (ZSH)

**Config:** `zsh/aliases.sh` | `zsh/functions/`

### Aliases - Navigation

| Alias | Command |
|-------|---------|
| `vim` / `v` | `nvim` |
| `dotfiles` | `cd ~/.dotfiles/ && vim .` |
| `notes` | `cd ~/notes/ && vim .` |
| `cdf` | `cd ~/.dotfiles` |
| `..` / `cd..` | `cd ..` |
| `...` | `cd ../../` |
| `....` | `cd ../../../` |
| `cls` | `clear` |
| `:q` | `exit` |
| `here` | `ofd` (open in Finder) |

---

### Aliases - Git

| Alias | Command |
|-------|---------|
| `g` | `git` |
| `lg` | `lazygit` |
| `gst` | `git status` |
| `gsa` | `git status -uall` |
| `gl` | `git pull` |
| `glr` | `git pull --rebase` |
| `gsp` | `git pull --rebase --autostash` |
| `gp` | `git push` |
| `gdf` | `git diff` |
| `gfl` | `git fetch --prune && git pull` |
| `gcf` | Checkout recent branch with fzf |
| `ungit` | Remove .git from project |

---

### Aliases - Git Sub-commands

> Using `g` (alias for `git`) with custom sub-commands defined in `gitconfig`

| Command | Description |
|---------|-------------|
| `git l` | Log graph (pretty oneline) |
| `git today` | Show commits from today |
| `git yesterday` | Show commits from yesterday |
| `g sg` | Diff staged files |
| `g d` | Diff |
| `g dff` | Diff using diff-so-fancy |
| `g dfh` | Diff HEAD using diff-so-fancy |
| `g dg` | Grep files to diff |
| `g df` | FZF files to diff |
| `g dv` | Diff using Vim |
| `g ag` | Grep files to add |
| `g af` | FZF files to add |
| `g cg` | Grep files to checkout |
| `g cf` | FZF files to checkout |

---

### Aliases - AI Assist

| Alias | Usage | Description |
|-------|-------|-------------|
| `aiwork` | `aiwork <branch_name> [main]` | Create a new git worktree and start a Tmux session with `tcode` setup |
| `aiwork-clean` | `aiwork-clean` | Remove current worktree and delete the Tmux session |

---

### Aliases - Tmux

| Alias | Command |
|-------|---------|
| `td` | Create/attach `default` session |
| `ide` | `tcode` (setup IDE session) |
| `tls` | `tmux ls` |
| `tat` | `tmux attach -t` |
| `tns` | `tmux new-session -s` |
| `tks` | `tmux kill-session -t` |
| `tkf` | `tmuxkillfzf` (kill session via FZF) |
| `tksv` | `tmux kill-server` |

---

### Aliases - Kubernetes

| Alias | Command |
|-------|---------|
| `k` | `kubectl` |
| `kgctx` | `kubectl config get-contexts` |
| `ksctx` | `kubectl config use-context` |
| `kgpo` / `kgpoan` | Get pods (all namespaces) |
| `kgsvc` | Get services (all namespaces) |
| `kdesc` | Describe (all namespaces) |
| `kgpog` / `kgrep` | Grep pods/services |
| `klogs` | Logs (all namespaces) |
| `kport` | Port forward |
| `krollstatus` / `krollback` | Rollout status / undo |
| `knodersc` | Node resources |
| `kpodrsc` | Pod resources |
| `kscaleup` / `kscaledown` | Scale replicas up/down |
| `krestart` | Restart deployment |
| `kdpod` | Delete pod |
| `kgproj` | Get current gcloud project |

---

### Aliases - Docker

| Alias | Command |
|-------|---------|
| `dps` | `docker ps` |
| `dpsa` | `docker ps -a` |
| `drm` | `docker rm` |
| `drmi` | `docker rmi` |

---

### Aliases - System

| Alias | Command |
|-------|---------|
| `grep` | `grep --color=auto` |
| `egrep` | `egrep --color=auto` |
| `count` | `wc -l` |
| `forgot` | `tldr` |
| `topcpu` | `top -o cpu` |
| `topmem` | `top -o rsize` |
| `cleanup_dsstore` | Remove `.DS_Store` files recursively |
| `cleanup_nodemodules` | Remove `node_modules` directories |
| `cleanup_javabuilds` | Remove `target` directories |
| `cleanup_serverless` | Remove `.serverless` directories |
| `cleanup_jupyter` | Remove `.ipynb_checkpoints` |

---

### FZF Bindings

> Bindings active inside the FZF preview

| Key | Action |
|-----|--------|
| `ctrl-y` | Copy selected to clipboard |
| `ctrl-v` | Open in Vim |
| `ctrl-s` | Open in VS Code |
| `ctrl-t` | Open in Tmux |
| `ctrl-o` | Open with default app |
| `?` | Toggle preview |
| `ctrl-a` | Select all |

---

### Functions - Tmux

**File:** `zsh/functions/tmux_helpers.sh`

| Function | Usage | Description |
|----------|-------|-------------|
| `tm` | `tm [SESSION_NAME]` | Create/switch tmux session (FZF) |
| `tcode` | `tcode [SESSION] [DIR]` | Setup IDE session: 3 windows (src, ai, run) |
| `tcd` | `tcd` | Create session from current directory name |
| `tfd` | `tfd [PATH]` | Create session from selected folder |
| `tmf` | `tmf [PATH]` | Open folder in tmux (sessionizer) |
| `tsp` | `tsp` | Switch pane with FZF |
| `tc` | `tc` | Interactive session menu |
| `tmuxkillfzf` | `tmuxkillfzf` | Kill session(s) via FZF |

---

### Functions - Finders

**File:** `zsh/functions/finders.sh`

| Function | Usage | Description |
|----------|-------|-------------|
| `brainsearch` | `brainsearch <TERM>` | Search notes and open in nvim |
| `cheat` | `cheat <COMMAND>` | Show command cheatsheet |
| `ff` | `ff <TERM>` | Find file by name |
| `ffd` | `ffd [PATH] <TERM>` | Find directory by name |
| `fif` | `fif <TERM>` | Find files by content |

---

### Functions - Git

**File:** `zsh/functions/git_helpers.sh`

| Function | Usage | Description |
|----------|-------|-------------|
| `prcreate` | `prcreate [BRANCH] [TITLE]` | Create PR (autofill or with title) |
| `prmerge` | `prmerge [PR#]` | Merge PR + delete branch |
| `prlist` | `prlist` | List open PRs |
| `prcheck` | `prcheck [PR#]` | Checkout PR and show diff |
| `gtag` | `gtag <VERSION>` | Create and push git tag |
| `hotfix_new` | `hotfix_new [MSG]` | Create hotfix branch and PR |
| `gfixupstream` | `gfixupstream` | Set upstream for current branch |

---

### Functions - Projects

**File:** `zsh/functions/projects.sh`

| Function | Usage | Description |
|----------|-------|-------------|
| `build` | `build` | Smart build (Java/Node/.NET) |
| `run` | `run` | Run project (Java/Node/.NET) |
| `tests` | `tests` | Run project tests |
| `cleanup_java_ide` | `cleanup_java_ide` | Clean Java IDE files |
| `new_spring_boot` | `new_spring_boot [NAME] [GROUP] [DEPS]` | Generate Spring Boot project |
| `jupyterlab` | `jupyterlab` | Start JupyterLab with venv |
| `pyenv` | `pyenv` | Setup/activate Python venv |
| `pyenv_pip3` | `pyenv_pip3 [PKGS]` | Install packages in venv |

---

### Functions - Containers & Kubernetes

**File:** `zsh/functions/containerization.sh`

| Function | Usage | Description |
|----------|-------|-------------|
| `ds` | `ds [TERM]` | Stop Docker container (FZF) |
| `drm` | `drm [TERM]` | Remove Docker container (FZF) |
| `ksh` | `ksh <POD> [NS]` | Connect to pod shell |
| `kshf` | `kshf` | Connect to pod shell (FZF) |
| `kdpof` | `kdpof` | Delete pod (FZF) |
| `klogsf` | `klogsf` | View pod logs (FZF) |

---

### Functions - AWS

**File:** `zsh/functions/aws_helpers.sh`

| Function | Usage | Description |
|----------|-------|-------------|
| `awsFindGroupName` | `awsFindGroupName [QUERY]` | Find CloudWatch log group |
| `awsFindLogStream` | `awsFindLogStream <GROUP>` | List log streams |
| `awsLogStreamFzf` | `awsLogStreamFzf <GROUP>` | Select log stream via FZF |
| `awsLambdaLog` | `awsLambdaLog <LAMBDA>` | View Lambda logs |
| `awsLambdaEventView` | `awsLambdaEventView <LAMBDA>` | View event mappings |
| `awsLambdaEventOff` | `awsLambdaEventOff <LAMBDA>` | Disable event mapping |
| `awsLambdaEventOn` | `awsLambdaEventOn <LAMBDA>` | Enable event mapping |
| `awsSqsFind` | `awsSqsFind <FILTER>` | Find SQS queue |
| `awsSqsGetAttr` | `awsSqsGetAttr <QUEUE_URL>` | Get queue attributes |
| `awsSqsGetMsg` | `awsSqsGetMsg <QUEUE_URL>` | Get messages |
| `awsSqsReadMsg` | `awsSqsReadMsg [FILTER]` | Read message (FZF) |
| `awsSqsSendMsg` | `awsSqsSendMsg <MSG> [URL]` | Send message |

---

### Functions - Utilities

**File:** `zsh/functions/utils.sh`

| Function | Usage | Description |
|----------|-------|-------------|
| `silent_background` | `silent_background <CMD>` | Run command silently in background |
| `ipexternal` | `ipexternal` | Show external IP |
| `ipforwarded` | `ipforwarded` | Show forwarded IP |
| `rss` | `rss <PID>` | Get RSS memory for process |
| `random_password` | `random_password [LENGTH]` | Generate random password (default: 8 chars) |

**Traffic/Stress Testing** (`traffic_generator.sh`):

| Function | Usage | Description |
|----------|-------|-------------|
| `generate_traffic` | `generate_traffic <URL> [CONC] [SLEEP]` | Load test with concurrent requests |
| `stress_command` | `stress_command <CMD> [CONC] [SLEEP]` | Stress test a command |
| `ab_get_test` | `ab_get_test <URL> [TOTAL] [CONC]` | Apache Bench GET test |
| `ab_post_test` | `ab_post_test <URL> <PAYLOAD> [TOTAL] [CONC]` | Apache Bench POST test |

---

## Aerospace (Window Manager)

**Config:** `.config/aerospace/aerospace.toml`

### Workspaces

| Shortcut | Action |
|----------|--------|
| `cmd-ctrl-1/2/3/4` | Switch to workspace 1/2/3/4 |
| `cmd-ctrl-tab` | Toggle between last workspaces |
| `cmd-ctrl-alt-n` | Move window to next workspace |
| `cmd-ctrl-alt-p` | Move window to previous workspace |

---

### Window Focus

| Shortcut | Action |
|----------|--------|
| `cmd-alt-h/j/k/l` | Focus window left/down/up/right |
| `cmd-alt-t` | Toggle floating/tiling |
| `cmd-alt-enter` | Fullscreen window |
| `alt-tab` | Switch between windows |

---

### Move Windows

| Shortcut | Action |
|----------|--------|
| `cmd-alt-shift-h/j/k/l` | Move window left/down/up/right |
| `cmd-alt-shift-1/2/3/4` | Move window to workspace 1/2/3/4 |
| `cmd-ctrl-shift-alt-h/j/k/l` | Move and split window left/below/upper/right |

---

### Monitors

| Shortcut | Action |
|----------|--------|
| `cmd-ctrl-h` / `cmd-ctrl-left` | Focus previous monitor |
| `cmd-ctrl-l` / `cmd-ctrl-right` | Focus next monitor |
| `cmd-ctrl-shift-h` / `cmd-ctrl-shift-left` | Move window to previous monitor |
| `cmd-ctrl-shift-l` / `cmd-ctrl-shift-right` | Move window to next monitor |

---

### Layout & Resize

| Shortcut | Action |
|----------|--------|
| `alt-slash` | Cycle layouts: tiles/horizontal/vertical |
| `alt-comma` | Cycle layouts: accordion/horizontal/vertical |
| `cmd-alt-shift-minus` / `cmd-alt-shift-equal` | Smart resize smaller/larger |
| `alt-shift-minus` / `alt-shift-equal` | Smart resize smaller/larger |
| `alt-shift-0` | Balance window sizes |

---

### Special Modes

| Shortcut | Action |
|----------|--------|
| `alt-shift-semicolon` | Enter **service mode** |
| `alt-shift-r` | Enter **resize mode** |
| `alt-shift-enter` | Enter **apps mode** |

**Service Mode:**

| Key | Action |
|-----|--------|
| `esc` | Exit service mode |
| `r` | Reload config |
| `t` | Flatten workspace |
| `backspace` | Close all windows except current |

**Resize Mode:**

| Key | Action |
|-----|--------|
| `h` / `l` | Resize width left/right |
| `j` / `k` | Resize height down/up |
| `enter` / `esc` | Exit resize mode |

---

### Apps Mode

| Key | Action |
|-----|--------|
| `alt-t` | Open Ghostty |
| `alt-b` | Open Brave Browser |
| `alt-o` | Open Obsidian |
| `alt-s` | Open VS Code |

---

## Rectangle (Window Snapping)

**Config:** `rectangle/RectangleConfig.json`

> All shortcuts use `cmd+alt` (Option+Command)

| Shortcut | Action |
|----------|--------|
| `cmd+alt+enter` | Maximize window |
| `cmd+alt+left` | Left half |
| `cmd+alt+right` | Right half |
| `cmd+alt+up` | Top half |
| `cmd+alt+down` | Bottom half |
| `cmd+alt+u` | Top left corner |
| `cmd+alt+i` | Top right corner |
| `cmd+alt+j` | Bottom left corner |
| `cmd+alt+o` | Bottom right corner |
| `cmd+alt+d` | First two thirds |
| `cmd+alt+e` | Last two thirds |
| `cmd+alt+c` | Center |
| `cmd+alt+1` | Almost maximize |

---

## Keyboard (QMK - YMDK SP64)

**Config:** `keyboard/ymdk-sp-64-layout-wesley.json`

### Layer 0 — Default (QWERTY)

Standard QWERTY layout with:
- `shift+esc` → Right Shift (tap) / Escape
- `MO(1)` → Momentarily activate Layer 1
- `MO(2)` → Momentarily activate Layer 2

### Layer 1 — Fn / Media

| Key (hold Fn) | Action |
|---------------|--------|
| `Esc` | F1 |
| `1-9` | F1-F9 |
| `0` | F10 |
| `-` | F11 |
| `=` | F12 |
| `H` | ← (Left) |
| `J` | ↓ (Down) |
| `K` | ↑ (Up) |
| `L` | → (Right) |
| Volume keys | Volume Up/Down/Mute |
| Media keys | Previous / Play-Pause |
| `Home` / `PgUp` / `PgDn` / `End` | Navigation |

### Layer 2 — RGB / Brightness

| Key (hold Fn2) | Action |
|----------------|--------|
| Brightness keys | Brightness Up/Down |
| RGB keys | RGB Mode cycle, speed, saturation, hue |
| `[` `]` | `{` `}` |
| `9` `0` | `(` `)` |
| Media extended | Additional media controls |
