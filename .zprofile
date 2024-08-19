export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-code}"
export PAGER="${PAGER:-less}"

# remove windows path to improve performance
# export PATH=$(p=$(echo $PATH | tr ":" "\n" | rg -v ".*/(windows|program files|Program Files|oculus).*" | tr "\n" ":"); echo ${p%:})
export KUBE_HOME=$HOME/.kube

export LESS="${LESS:--FgiMRSX -z 4 --wheel-lines 4 --mouse}"
export LESSOPEN='| lesspipe.sh %s'

# zsh-users/zsh-autosuggestions
# export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(
    match_prev_cmd
    completion
    history
)

# FZF
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --color=always --layout=default
  -E .git -E node_modules -E target'

# export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS='--ansi --walker-skip .git,node_modules,target  --layout=reverse'
export FZF_CTRL_T_OPTS="--preview='less {}' --height=100%"
export FZF_ALT_C_OPTS="--preview 'eza --icons --color=always --tree --recurse --level 2 --group-directories-first {}'"

# bat
[ -z "$(bat --list-themes | grep rose-pine 2>&1)" ] && bat cache --build
export BAT_THEME='rose-pine'
# can't really set the config dir under msys2, config will be under Windows AppData
# export BAT_CONFIG_DIR='${HOME}/.config/bat'

# misc
export DIRENV_LOG_FORMAT=""
export FORGIT_GLO_FORMAT='%C(auto)%h%d %p %s %C(bold black)<%an> %cr%Creset'
command -v vivid &>/dev/null && export LS_COLORS="$(vivid generate rose-pine)"
