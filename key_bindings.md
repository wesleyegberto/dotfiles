# Key Binding Mapping

My Vim key bindings.

```
\st              " Show startify
```

##### Nerdtree

```
\t               " toggle nerdtree
\y               " reveal file in nerdtree
```

On NERDTree tab:

```
m                " Show menu
t                " open the selected file in a new tab
i                " open the selected file in a horizontal split window
s                " open the selected file in a vertical split window
I                " toggle hidden files
m                " show the NERD Tree menu
R                " refresh the tree, useful if files change outside of Vim
?                " toggle NERD Tree's quick help
```

##### Windows and Tabs

Windows manipulation:
```
<C-w>s           " split current window horizontally (alternative :split)
<Leader>ws       " split current window horizontally (alternative :split)
<C-w>v           " split current window vertically (alternative :vsplit)
<Leader>wv       " split current window vertically (alternative :vsplit)
<C-w>c           " close current window
<Leader>wd       " close current window
<C-w>q           " close current window
<C-w>#<          " Shrink/resize current window from the right by # (default 1)
<C-w>#>          " Increase/resize current window to the right by # (default 1)
<Leader>wth      " flip split window from vertical to horizontal
<Leader>wtk      " flip split window from horizontal to vertical
```

Navigation between windows:
```
<C-w>w           " Jump to the next window
<C-w><ARROW>     " Jump to window left/right/top/bottom (arrow keys) to the current
<C-\>            " go previous window
<C-h>            " left window
<C-j>            " down window
<C-k>            " up window
<C-l>            " right window
:q<index>        " close window with index
```

Navigation between tabs:
```
gt               " go to next tab
gT               " go to previous tab
#gt              " go to tab at index #
gb or ]b         " go to next buffer
gB or [b         " go to previous buffer
```

##### Searching

```
C-p              " fuzzy finder using FZF
\b               " display all buffers to select (hjkl to navigate, <C-s> :sv, <C-v> :vs)
\B               " list the tabs for selection
\<Space>         " clear searching results
*                " find current word and jump next occurrence
[i               " show first occurrence of current word
[I               " show all occurrences of current word
```

##### Navigation

```
g;               " go to last edition position
g.               " go to next edition position
%                " jump to matching () or {} or []
{                " go to previous paragraph
}                " go to next paragraph
[/               " go to start of first comment block /* */
]/               " go to end of first comment block /* */
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

##### Enclosing navigation (between [], (), {})

```
[%               " go to previous enclosing [ or ( or {
]%               " go to next enclosing ] or ) or }
[{               " go to enclosing {
]}               " go to enclosing }
[(               " go to enclosing (
])               " go to enclosing )
[m               " go to start of previous body
]m               " go to start of next body
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

##### Coc-Vim and Omnisharp-Vim

```
<C-Space>        " refresh autocomplete (INSERT MODE)
\qf              " quick fix for current line
\coqf            " quick fix for C#
gd               " go to definition
gi               " go to implementation
gD               " peek definition
gI               " peek implementation
gr               " find references
\crn             " rename var
```

##### Coc-Vim

```
gy               " go to type
\cd              " show documentation
gh               " show documentation
\cf              " format buffer
\csf             " format selection
```

Actions (after \a we can cursor motion to select a block - like w or p)

```
\cal             " action for current line
\cas             " if we have a selection otherwise we will need to provide a cursor motion to select a block (like: `\cas` -> action for current sentence)
\casw            " action for current word
```

##### Snippets

```
<C-l>            " cut the selected content to use inside a snippet (when used later)
<C-n>            " next item
<C-p>            " previous item
```