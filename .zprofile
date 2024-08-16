export TERM=xterm-256color
export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-code}"
export PAGER="${PAGER:-less}"

export KUBE_HOME=$HOME/.kube

export LESSOPEN='| lesspipe.sh %s'
# export LESS="-R"
export LESS="${LESS:--F -g -i -M -R -S -w -X -z-4}"

export ZSH_AUTOSUGGEST_STRATEGY=(
    completion
    history
)

export DIRENV_LOG_FORMAT=""
export FORGIT_GLO_FORMAT='%C(auto)%h%d %p %s %C(bold black)<%an> %cr%Creset'
command -v vivid &>/dev/null && export LS_COLORS="$(vivid generate rose-pine)"
