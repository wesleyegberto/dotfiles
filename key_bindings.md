# Tmux Key Bindings

Help: `<Leader>?`

## Session

```
<Leader>$           " rename session
<Leader>s           " choose session
<Leader>d           " detach from session

<Leader>)           " next session
<Leader>(           " previous session
<Leader>L           " go to last active session
```

## Window

```
<Leader>c           " create new window
<Leader>,           " rename window
<Leader>w           " choose window

<Leader>n           " next window
<Leader>p           " previous window
<Leader>#           " jump to #-th window
<Leader>l           " go to last active window

<Leader>X           " kill window
```

## Panes

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

## Misc

```
<Leader>[           " Use VI keys in buffer
```

# Vim Key Bindings

```
\st              " Show startify
```

##### Folder Explorer

```
\e               " toggle coc-explorer
\E               " show coc-explorer in floating mode
\ev              " show coc-explorer with .vim folder
```

Item action

```
a                " addFile
A                " addDirectory
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

##### Windows and Tabs

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
<Leader>wfh      " flip split window from vertical to horizontal
<Leader>wfv      " flip split window from horizontal to vertical
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

\bp              " go to next buffer
\bn              " go to previous buffer
\bf              " go to first buffer
\bl              " go to last buffer
\bd              " delete current buffer
\bk              " wipeout current buffer (delete with marks and so on)
```

##### Searching

```
C-p              " finder using FZF
\ff              " find file
\fb              " find buffer
\fr              " find file with content
\ft              " find tag
\fm              " find mark
```

In FZF result use:

```
C-t              " open new tab
C-s              " open in a horizontal split window
C-v              " open in a vertical split window
```

```
*                " find current word and jump next occurrence
#                " jump previous occurrence
<Space><Space>   " clear searching results
[i               " show first occurrence of current word
[I               " show all occurrences of current word
```

##### Navigation

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

##### Navigation in Insert and Command Mode

```
<C-h>            " Left
<C-j>            " Down
<C-k>            " Up
<C-l>            " Right
<C-a>            " Start of the line
<C-e>            " End of the line
```

##### Git

```
\gf              " fetch
\gp              " pull
\gr              " rebase
\gs              " status
\gm              " modified files
\gc              " commit
\gP              " push
\gl              " log
\gb              " blame
\gv              " diff vertical split
\gh              " diff horizontal split

```

##### terryma/vim-multiple-cursors

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


##### Git changes navigation

```
[c               " go to previous git change
]c               " go to next git change
```

##### Diagnostic navigation

```
[g               " navigate to previous diagnostic (coc-vim)
]g               " navigate to next diagnostic (coc-vim)
[l               " navigate to previous diagnostic (syntastic)
]l               " navigate to next diagnostic (syntastic)
```

##### Vim-Unimpaired

```
[e               " move current line above
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

##### Vim-Surround

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

##### Coc-Vim

```
<C-Space>        " refresh autocomplete (INSERT MODE)
gd               " go to definition
gi               " go to implementation
gD               " peek definition
gI               " peek implementation
gy               " go to type
gr               " find references
gh               " show documentation
\ck              " show documentation
\cfm             " find members
```

```
\cf              " format buffer
\csf             " format selection
\crn             " rename var
```

Actions (after \a we can cursor motion to select a block - like w or p)

```
\cqf             " quick fix
\cal             " action for current line
\cas             " if we have a selection otherwise we will need to provide a cursor motion to select a block (like: `\cas` -> action for current sentence)
\cam#            " action for a cursor motion (like: `\cams` -> action for current sentence)
```

```
<space>a            " CocFzfList actions
<space>g            " CocFzfList diagnostics
<space>G            " CocFzfList diagnostics --current-buf
<space>c            " CocFzfList commands
<space>e            " CocFzfList extensions
<space>l            " CocFzfList location
<space>o            " CocFzfList outline
<space>s            " CocFzfList symbols
<space>p            " CocFzfListResume
```

##### Omnisharp.vim

```
\clc             " code check
\cls             " server start
\clr             " server restart
\clp             " server stop
```

##### Snippets

```
\cfs             " find symbols

<C-l>            " cut the selected content to use inside a snippet (when used later)
<C-n>            " next item
<C-p>            " previous item
```