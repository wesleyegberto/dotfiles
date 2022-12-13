#!/usr/bin/env bash

# Select a running docker container to stop
# Usage: `ds <TERM>`
# source: https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select a docker container to remove
# Usages: `drm <TERM>`
# source: https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}

# Connect to a Kubernetes pod
kpsh() {
  if [ -z "$1" ]; then
    echo "Usage: kpsh <pod-name>"
    return
  fi
  kubectl get po --all-namespaces | fzf | awk '{print $2}' | xargs -I {} kubectl exec -it {} sh
}

# Delete a Kubernetes pod
kdpo() {
  if [ -z "$1" ]; then
    echo "Usage: kdpo <pod-name>"
    return
  fi

  kubectl get pods --all-namespaces | grep "$1" | awk '{print $1}' | xargs kubectl delete pod --all-namespaces
}

# Connect to a pod using shell
# Usage: `ksh dev my-prod-id`
ksh() {
  if [ ! "$#" -gt 0 ]; then
    echo "Usage: ksh <pod-name> <namespace>"
    return
  fi

  podName="$1"
  namespace="$2"
  if [ -z "$namespace" ]; then
    namespace="default"
  fi

  kubectl exec -it "$podName" -n "$namespace" -- sh
}

# Delete pod found with FZF
# Usage: `kdpof`
kshf() {
  local podLine
  podLine=$(kubectl get pod --all-namespaces | fzf)
  if [ -z "$podLine" ]; then
    echo "Select a running pod"
    return
  fi

  namespace=$(echo "$podLine" | choose 0)
  podName=$(echo "$podLine" | choose 1)

  kubectl exec -it "$podName" -n "$namespace" -- sh
}

# Delete pod found with FZF
# Usage: `kdpof`
kdpof() {
  local podLine
  podLine=$(kubectl get pod --all-namespaces | fzf)
  if [ -z "$podLine" ]; then
    echo "Select a running pod"
    return
  fi

  namespace=$(echo "$podLine" | choose 0)
  podName=$(echo "$podLine" | choose 1)

  kubectl delete pod -n "$namespace" "$podName"
}

# Log pod found with FZF
# Usage: `klogsf`
klogsf() {
  local podLine
  podLine=$(kubectl get pod --all-namespaces | fzf)
  if [ -z "$podLine" ]; then
    echo "Select a running pod"
    return
  fi

  namespace=$(echo "$podLine" | choose 0)
  podName=$(echo "$podLine" | choose 1)

  kubectl logs -n "$namespace" -f "$podName"
}

