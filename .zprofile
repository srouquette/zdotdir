export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-code}"
export PAGER="${PAGER:-less}"

export KUBE_HOME=$HOME/.kube

export LESS="${LESS:--FgiMRSX -z 4 --wheel-lines 4 --mouse}"
export LESSOPEN='| lesspipe.sh %s'

export ZSH_AUTOSUGGEST_STRATEGY=(
    completion
    history
)

export DIRENV_LOG_FORMAT=""
export FORGIT_GLO_FORMAT='%C(auto)%h%d %p %s %C(bold black)<%an> %cr%Creset'
command -v vivid &>/dev/null && export LS_COLORS="$(vivid generate rose-pine)"

# Configure FZF.
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --color=always
  -E .git -E node_modules -E target'
# export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS='--ansi --walker-skip .git,node_modules,target'

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview='less {}'
  --bind shift-up:preview-page-up,shift-down:preview-page-down
  --height=100%"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'eza -R -T --icons --color=always {}'
  --bind shift-up:preview-page-up,shift-down:preview-page-down"
