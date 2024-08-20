#
# __init__: This runs prior to any other conf.d contents.
#

export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-code}"
export PAGER="${PAGER:-less}"

# remove windows path to improve performance
export PATH=$(p=$(echo $PATH | tr ":" "\n" | rg -v ".*/(windows$|windows/system32/|program files|Program Files|oculus)" | tr "\n" ":"); echo ${p%:})
export KUBE_HOME=$HOME/.kube

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $prepath
  $path
)

##--------- misc
export DIRENV_LOG_FORMAT=""
export FORGIT_GLO_FORMAT='%C(auto)%h%d %p %s %C(bold black)<%an> %cr%Creset'
command -v vivid &>/dev/null && export LS_COLORS="$(vivid generate rose-pine)"

export FIND_EXCLUDE_LIST=(.git .svn .hg CVS node_modules target .vscode .idea)
export GREP_EXCLUDE=$(IFS=, ; echo "${FIND_EXCLUDE_LIST[*]}")
