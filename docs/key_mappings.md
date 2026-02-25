# My Key Mappings

## Windows Management

Displays:

```
cmd + ctrl + left                  " focus left display
cmd + ctrl + right                 " focus right display
cmd + ctrl + h                     " focus left display
cmd + ctrl + l                     " focus right display

cmd + ctrl + shift + left          " move window to left display
cmd + ctrl + shift + right         " move window to right display
cmd + ctrl + shift + h             " move window to left display
cmd + ctrl + shift + l             " move window to right display
```

Layout:

```
alt + ,                            " toggle tiles vertical/horizontal
alt + /                            " toggle tailing vertical/horizontal
```

Workspaces:

```
cmd + ctrl + #                     " go to workspace at index #
cmd + alt + shift + #              " move window to workspace at index #

cmd + ctrl + tab                   " go to last focused workspace

cmd + ctrl + alt + n               " move windowgo to next workspace
cmd + ctrl + alt + p               " move window to previous workspace
```

Windows:

```
cmd + alt + j                      " focus below window
cmd + alt + k                      " focus upper window
cmd + alt + h                      " focus left window
cmd + alt + l                      " focus right window

cmd + shift + alt + h              " swap left window
cmd + shift + alt + j              " swap below window
cmd + shift + alt + k              " swap below window
cmd + shift + alt + l              " swap right window

cmd + ctrl + shift + alt + h       " move and split window to left
cmd + ctrl + shift + alt + j       " move and split window to below
cmd + ctrl + shift + alt + k       " move and split window to upper
cmd + ctrl + shift + alt + l       " move and split window to right

cmd + alt + enter                  " maximize window

alt + tab                          " go to last focused window
```

## Terminal

Leader key is `C-a`.

```
C-S-l               " cycle window layout

<Leader>c           " create new tab
<Leader>|           " create new window aside
<Leader>-           " create new window aside
<Leader>C           " create new window

<Leader>shift+.     " move window to right
<Leader>shift+,     " move window to left

<Leader>x           " close window
<Leader>d           " close tab
<Leader>,           " rename tab

<Leader>#           " go to tab #

<Leader>S-j         " resize window
<Leader>S-k         " resize window
<Leader>S-h         " resize window
<Leader>S-l         " resize window

C-S-Delete          " clear terminal
Cmd-A-r             " clear terminal

C-S-a>m             " increase background opacity
C-S-a>l             " decrease background opacity
C-S-a>d             " reset background opacity
C-S-a>1             " full background opacity
```

## Tmux

Leader key is `C-b`.
Reload config: `<Leader>C-r`

Help: `<Leader>?`

### Session

```
<Leader> C-c         " create new session
<Leader> $           " rename session
<Leader> C-f         " find session
<Leader> s           " choose session
<Leader> C-m         " choose session
<Leader> d           " detach from session

<Leader> )           " next session
<Leader> (           " previous session
<Leader> S-l         " go to last active session
<Leader> C-l         " go to last active session
```

### Window

```
<Leader> <           " window menu
<Leader> C-c         " create new window
<Leader> ,           " rename window
<Leader> w           " choose window

<Leader> n           " next window
<Leader> p           " previous window
<Leader> #           " jump to #-th window
<Leader> l           " go to last active window

<Leader> X           " kill window
```

### Panes

```
<Leader> >           " pane menu
<Leader> |           " split pane vertically
<Leader> -           " split pane horizontally
<Leader> ;           " go to last active pane
<Leader> o           " go to next pane

<Leader> {           " move current pane to left
<Leader> }           " move current pane to right
<Leader> C-<Arrow>  " resize pane

<Leader> q           " shot pane numbers
<Leader> q <number>  " select pane by number
<Leader> <Space>     " toggle between pane layouts

<Leader> +           " zoom pane
<Leader> !           " convert pane to a new window
<Leader> x           " close current pane
```

### Tools

```
<Leader> C-t         " TODO note
<Leader> C-g         " Lazygit
<Leader> C-v         " Neovim
<Leader> C-s         " VSCode
<Leader> C-i         " AI CLI (Gemini or Claude Code)
```

### Misc

```
<Leader> [           " Use VI keys in buffer
```

## Vim

Leader key is `<Space>`.

```
<Leader>S;          " Show startify
<Leader>Sf          " find session
```

### Folder Explorer

```
<Leader>e               " toggle explorer
```

Item action

```
a                " addFile
r                " rename
c                " copyFile
x                " cutFile
p                " pasteFile
d                " delete
y                " copyFilepath
Y                " copyFilename
R                " refresh

h                " collapse folder
gh               " collapse recursive
l                " expand folder
gl               " expand recursive
o                " toggle collapsed/expanded
<CR>             " expand folder or open file
e                " open the selected file
s                " open the selected file in a vertical split window
v                " open the selected file in a horizontal split window
e                " open the selected file in a new tab
.                " toggleHidden
X                " open item using system defaults
```

Navigation:

```
gf               " gotoSource:file
gb               " gotoSource:buffer
[d               " diagnosticPrev
]d               " diagnosticNext
[l               " previous location in list
]l               " next location in list
[c               " gitPrev
]c               " gitNext
<<               " gitStage
>>               " gitUnstage
```

### Windows and Tabs

Windows manipulation:
```
<C-w>s           " split current window horizontally (alternative :split)
<Leader>ws       " split current window horizontally (alternative :split)

<C-w>v           " split current window vertically (alternative :vsplit)
<Leader>wv       " split current window vertically (alternative :vsplit)

<Leader>wd       " close current buffer

<Leader>wc       " close current window
<C-w>c           " close current window
<C-w>q           " close current window

<C-w>#<          " Shrink/resize current window from the right by # (default 1)
<C-w>#>          " Increase/resize current window to the right by # (default 1)

<C-w>x           " flip windows
<Leader>wfh      " flip split window from vertical to horizontal
<Leader>wfv      " flip split window from horizontal to vertical

<C-w>H           " move panel to left
<C-w>L           " move panel to right
<C-w>J           " move panel to down
<C-w>K           " move panel to up
```

Navigation between windows:
```
<C-w>w           " Jump to the next window
<C-w><ARROW>     " Jump to window left/right/top/bottom (arrow keys) to the current
<C-\>            " go previous window
<C-h>            " jump to left window
<C-j>            " jump to down window
<C-k>            " jump to up window
<C-l>            " jump to right window
:q<index>        " close window with index
```

Navigation between buffers and tabs:
```
gt               " go to next tab
gT               " go to previous tab
#gt              " go to tab at index #

gb or ]b         " go to next buffer
gB or [b         " go to previous buffer
C-^              " go to last buffer

<Leader>bp       " go to next buffer
<Leader>bn       " go to previous buffer
<Leader>bf       " go to first buffer
<Leader>bl       " go to last buffer
<Leader>bd       " delete current buffer
<Leader>bk       " wipeout current buffer (delete with marks and so on)
```

### Searching

There are two tools to use with the following prefix:

* Telescope: `<Leader>f`
* FZF: `<Leader>F`

```
<Leader>f_       " open Telescope
<Leader>f;       " find command
<Leader>f/       " find command history
<Leader>f?       " find help tags


C-p              " fuzzy finder with Telescope
C-b              " fuzzy finder for buffers

<Leader>fw       " find open windows
<Leader>fe       " file explorer finder
<Leader>ff       " find file

<Leader>fb       " find buffer
<Leader>fL       " fuzzy finder buffer content
<Leader>fr       " find ripgrep

<Leader>fgf      " find file in git
<Leader>fgs      " find file in git chages
<Leader>fgc      " find git commit
<Leader>fgC      " find git commit in current buffer

<Leader>fm       " find mark
<Leader>ft       " find tag
<Leader>fT       " find tag in current buffer

<Leader>fX       " find tmux sessions
<Leader>fS       " find sessions
<Leader>fP       " find projects

```

In result use:

```
C-t              " open new tab
C-x              " open in a horizontal split window
C-v              " open in a vertical split window
```

Buffer content:

```
*                " find current word and jump next occurrence
#                " jump previous occurrence
<Leader><Esc>    " clear searching results
[i               " show first occurrence of current word
[I               " show all occurrences of current word

<Leader>sf       " select tresitter node

zm               " fold most inner open scope
zM               " fold all scopes
zr               " unfold most inner open scope
zR               " unfold all scopes
```

Harpoon:

```
<Leader>mM      " show quick menu
<Leader>mt      " toggle file
<Leader>ma      " add file
<Leader>md      " remove file
<Leader>mC      " clear all files
<Leader>m#      " go to file #
```

### Navigation

```
g;               " go to last edition position
g.               " go to next edition position

`^               " last position of cursor in insert mode
`.               " last change in current buffer
`<               " to beginning of last visual selection
`>               " to end of last visual selection
`[               " go to the beginning of last changed or yanked txt
`]               " go to the end of last changed or yanked txt

%                " jump to matching () or {} or []
{                " go to previous paragraph
}                " go to next paragraph
[/               " go to start of first comment block /* */
]/               " go to end of first comment block /* */

[m               " go to start of previous body
]m               " go to start of next body
[M               " go to end of previous body
]M               " go to end of next body

H                " mapped to ^
L                " mapped to $

[%               " go to previous enclosing [ or ( or {
]%               " go to next enclosing ] or ) or }
[{               " go to enclosing {
]}               " go to enclosing }
[(               " go to enclosing (
])               " go to enclosing )
```

#### Git changes navigation

```
[c               " go to previous git change
]c               " go to next git change
```

#### Diagnostic navigation

```
[g               " navigate to previous diagnostic (coc-vim)
]g               " navigate to next diagnostic (coc-vim)
[l               " navigate to previous diagnostic (syntastic)
]l               " navigate to next diagnostic (syntastic)
```

#### Treesitter

```
]]               " go to next element
[[               " go to previous element
]f               " go to next function
[f               " go to previous function
]s               " go to next scope
[s               " go to previous scope
]z               " go to next fold
[z               " go to previous fold
```

### Editing

```
<M-Up>           " move current line above
<M-Down>         " move current line bellow

[<Space>         " add blankline before current line
]<Space>         " add blankline after current line
```

### Navigation in Insert and Command Mode

```
<C-h>            " Left
<C-j>            " Down
<C-k>            " Up
<C-l>            " Right
<C-a>            " Start of the line
<C-e>            " End of the line
```

### Git

```
<Leader>gf       " fetch
<Leader>gp       " pull
<Leader>gr       " rebase
<Leader>gm       " modified files
<Leader>gs       " diff status
<Leader>gS       " status
<Leader>gc       " commit
<Leader>gP       " push
<Leader>gl       " log
<Leader>gb       " blame inline
<Leader>gB       " blame view
<Leader>gdf      " diff current file
<Leader>gdc      " close diff view
<Leader>gv       " diff vertical split
<Leader>gh       " diff horizontal split
```

### terryma/vim-multiple-cursors

```
<M-n>            " start multicursor and directly select all matches
<C-n>            " start multicursor and add a virtual cursor + selection on the match
```

After `<C-n>`:

```
<C-n>            " add a new virtual cursor + selection on the next match
<C-x>            " skip the next match
<C-p>            " remove current virtual cursor + selection and go back on previous match
```

### Vim-Surround

Using `{`, `(` or `[` will wrap the content with a space between the `{}`, `()` or `[]`.
Ysing `}`, `]`, `)` will wrap the content with no space.
Format: `cs<CHAR_TO_REPLACE><CONTENT_REPLACE><cr>`

Examples:

```
cs"'             " replace surrounding the " to '
ds"              " delete surrounding "
yss)             " wrap the line with ()
yss}             " wrap the line with {}
ysiw]            " wrap the current word (iw -> inner word) with ]
```

### LSP

```
<C-Space>        " refresh autocomplete (INSERT MODE)

[g               " go to previous diagnostic
]g               " go to next diagnostic

gd               " go to definition
gD               " peek definition
gi               " go to implementation
gI               " peek implementation
gt               " go to type definition
gr               " find references
glt              " go to last run test

gh               " hover action
<Leader>cdl      " show line diagnostics
<Leader>cdp      " show workspace diagnostics
<Leader>cdt      " show view diagnostics

<Leader>ch       " show documentation
C-\              " show documentation (Insert Mode)

<Leader>cft      " find workspace symbols
<Leader>cfm      " find members
<Leader>cfi      " find ingoing calls
<Leader>cfo      " find outgoing calls
```

Actions:

```
<Leader>csf      " format buffer (when Visual Mode, format the selecion)
<Leader>crn      " rename var

<Leader>cqf      " quick fix

<Leader>cal      " action for current line
<Leader>cas      " action for selected content in Visual Mode
<Leader>cam      " action menu with preview
```

Tests:

```
<Leader>rta      " run all tests
<Leader>rtf      " run file test
<Leader>rtl      " run last test

<Leader>pb       " run project build 
<Leader>pb       " run project build 
<Leader>pc       " run project clean 
<Leader>pp       " run project package 
<Leader>pta      " run project tests
<Leader>ptf      " run project test from current file
```

#### Java

```
<Leader>cro      " organize imports

<Leader>crm      " extract method
<Leader>crv      " extract variable
<Leader>crc      " extract constant

<Leader>rtc      " run test class
<Leader>rtn      " run nearest test method
```

Debug:

```
<Leader>dt       " run test class
<Leader>ds       " stop debug

<Leader>dv       " toggle debug view
<Leader>dt       " toggle repl view
<Leader>de       " eval selected expression
<Leader>dp       " view selected expression in preview window
<Leader>dh       " view selected expression in float window
<Leader>ds       " show scopes
<Leader>df       " show frames

F5               " continue/start debug
S-F5             " stop debug
F9               " toggle breakpoint
S-F9             " remove all breakpoints
F10              " step over
F11              " step into
S-F11            " step out
F12              " step out
```

#### Omnisharp.vim

```
<Leader>clc      " code check
<Leader>cls      " server start
<Leader>clr      " server restart
<Leader>clp      " server stop
```

### Snippets

```
<Leader>cfs      " find symbols

<C-l>            " cut the selected content to use inside a snippet (when used later)
<C-n>            " next item
<C-p>            " previous item
```

## Shortcut:

**Format JSON**

Select the JSON and execute: `!jq` to replace the selected content with the output from JQ.

