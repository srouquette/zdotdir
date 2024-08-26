#
# __init__: This runs prior to any other conf.d contents.
#

export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-code}"
export PAGER="${PAGER:-less}"
export KUBE_HOME=$HOME/.kube

# remove windows path to improve performance, but costs some start up time
# export PATH=$(echo $PATH | tr ':' '\n' | rg -v '.*/(windows$|windows/system32/|AppData|program files|Program Files|oculus)' | paste -sd ':' -)

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

##--------- zsh-autosuggestions
# export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold'
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(
    match_prev_cmd
    history
    completion
)

##--------- misc
export DIRENV_LOG_FORMAT=""
export FORGIT_GLO_FORMAT='%C(auto)%h%d %p %s %C(bold black)<%an> %cr%Creset'
