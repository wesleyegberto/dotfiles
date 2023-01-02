# My Key Mappings

## Kitty

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
<Leader>C-c         " create new session
<Leader>$           " rename session
<Leader>C-f         " find session
<Leader>s           " choose session
<Leader>d           " detach from session

<Leader>)           " next session
<Leader>(           " previous session
<Leader>L           " go to last active session
```

### Window

```
<Leader>C-c         " create new window
<Leader>,           " rename window
<Leader>w           " choose window

<Leader>n           " next window
<Leader>p           " previous window
<Leader>#           " jump to #-th window
<Leader>l           " go to last active window

<Leader>X           " kill window
```

### Panes

```
<Leader>|           " split pane vertically
<Leader>-           " split pane horizontally
<Leader>;           " go to last active pane
<Leader>o           " go to next pane

<Leader>{           " move current pane to left
<Leader>}           " move current pane to right
<Leader> C-<Arrow>  " resize pane
<Leader>< + Arrow>  " resize pane

<Leader>q           " shot pane numbers
<Leader>q <number>  " select pane by number
<Leader><Space>     " toggle between pane layouts

<Leader>+           " zoom pane
<Leader>!           " convert pane to a new window
<Leader>x           " close current pane
```

### Misc

```
<Leader>[           " Use VI keys in buffer
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
f                " search
F                " searchRecursive
gf               " gotoSource:file
gb               " gotoSource:buffer
[d               " diagnosticPrev
]d               " diagnosticNext
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

### Git changes navigation

```
[c               " go to previous git change
]c               " go to next git change
```

### Diagnostic navigation

```
[g               " navigate to previous diagnostic (coc-vim)
]g               " navigate to next diagnostic (coc-vim)
[l               " navigate to previous diagnostic (syntastic)
]l               " navigate to next diagnostic (syntastic)
```

### Vim-Unimpaired

```
[e               " Move current line above
]e               " move current line bellow
<M-Up>           " move current line above
<M-Down>         " move current line bellow
[<Space>         " add blankline before current line
]<Space>         " add blankline after current line
>p               " paste after linewise, increasing indent
>P               " paste before linewise, increasing indent
<p               " paste after linewise, decreasing indent
<P               " paste before linewise, decreasing indent
=p               " paste after linewise, reindenting
=P               " paste linewise, reindenting
[f               " go to the file preceding the current one
]f               " go to the file succeeding the current one
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

### Omnisharp.vim

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

