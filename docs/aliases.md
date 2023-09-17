# Terminal Aliases

## Bash

```
ff              " find file by name
ffd             " find directory by name
fif             " find file with content
```

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
```

### Helper functions

```
tc              " choose a tmux session or creates a new one
tcd             " start a tmux session using current dirname as session name

tm              " find a tmux session using FZF
tm $1           " attach to an existing session $1 or creates a new one

tfd $1          " start a tmux session using dirname from the given folder or FZF
tmf $1          " start a tmux session using dirname or select the existing session

tsp             " find a Tmux pane

ide             " create a session named `ide`
tcode           " create a session using folder name, with windows `src` running Vim and `run`
```

## Git

```
gcf             " FZF branches to checkout

git l           " log graph

git yesterday   " show commits from day before
git today       " show commits from today

g sg            " diff staged files

g d             " diff
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

## Kubernetes and Docker

```
ds              " Docker ps
drm             " Docker rm

kdpof           " FZF pods and delete

klogsf          " FZF pods and show logs

ksh             " connect with bash to pod name
kshf            " FZF pods and connect with sh

krestart        " rollout restart given deployment

kscaledown      " scale replica=0 given deployment
kscaleup        " scale replica=1 given deployment
```

