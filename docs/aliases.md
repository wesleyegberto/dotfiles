# Terminal Aliases

## Tmux

### Aliases

```
tls             " tmux ls

tat $1          " tmux attach to session named $1
tns $1          " create session named $1
tks $1          " kill session named $1

tkf             " kill session selected from FZF
tksv            " kill tmux server

td              " create or attach to session named `default`
ide             " create a session named `ide`
```

### Helper functions

```
tc              " choose a tmux session or creates a new one
tcd             " start a tmux session using current dirname as session name

tm              " find a tmux session using FZF
tm $1           " attach to an existing session $1 or creates a new one
tfd $1          " start a tmux session using dirname from the a folder selected from given path $1

tsp             " find a Tmux pane
```

## Git

```
git l           " log graph

git yesterday   " show commits from day before
git today       " show commits from today

g dff           " diff using diff-so-fancy
g dfh           " diff HEAD using diff-so-fancy
g dg            " grep files to diff
g df            " FZF files to diff
g dv            " diff using Vim

g ag            " grep files to add
g af            " FZF files to add

g cg            " grep files to checkout
g cf            " FZF files to checkout
```
