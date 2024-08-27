#!/bin/zsh
#
# .zshenv: Zsh environment file, loaded always.
#

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}

# Fish-like dirs
: ${__zsh_config_dir:=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}
: ${__zsh_user_data_dir:=${XDG_DATA_HOME:-$HOME/.local/share}/zsh}
: ${__zsh_cache_dir:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh}
: ${__zsh_comp_dir:=${__zsh_cache_dir}/completions}

# Ensure Zsh directories exist.
() {
  local zdir
  for zdir in $@; do
    [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
  done
} __zsh_{config,user_data,cache,comp}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_{RUNTIME,PROJECTS}_DIR

# since we don't use OMZ directly, we still need to define this when we use its plugins
export ZSH_CACHE_DIR=$__zsh_cache_dir

# Also done by OMZ, add completions dir to $fpath
export ZSH_COMPLETIONS_DIR=$__zsh_comp_dir
(( ${fpath[(Ie)$ZSH_COMPLETIONS_DIR]} )) || fpath=("$ZSH_COMPLETIONS_DIR" $fpath)

# Make Terminal.app behave.
if [[ "$OSTYPE" == darwin* ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi

export FIND_EXCLUDE_LIST=(.git .svn .hg CVS node_modules target .vscode .idea)
# cute but a bit "slow"
# export GREP_EXCLUDE=$(IFS=, ; echo "${FIND_EXCLUDE_LIST[*]}")
export GREP_EXCLUDE='.git,.svn,.hg,CVS,node_modules,target,.vscode,.idea'
command -v vivid &>/dev/null && export LS_COLORS=$(vivid generate ${ZSH_THEME:-rose-pine})
