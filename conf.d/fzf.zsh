#
# Configure fzf
#

command -v fzf &>/dev/null || return 0

# fd is better than rg to search file
# export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

# -E .git -E node_modules...
local fd_exclude="${FIND_EXCLUDE_LIST[@]/#/-E }"
export FD_COMMON_OPTS="--follow --hidden --color=always $fd_exclude"
export EZA_PREVIEW='eza --tree --recurse --level 3 --only-dirs --icons --color=always {}'

export FZF_DEFAULT_COMMAND="fd --type file $FD_COMMON_OPTS"
export FZF_DEFAULT_OPTS="--ansi --reverse --height=50% --inline-info
  --walker-skip $GREP_EXCLUDE
  --bind 'shift-up:preview-half-page-up'
  --bind 'shift-down:preview-half-page-down'
  --bind 'preview-scroll-up:preview-up+preview-up+preview-up+preview-up'
  --bind 'preview-scroll-down:preview-down+preview-down+preview-down+preview-down'"

# use .lessfilter instead of less to avoid paging, which cut the content randomly
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS="--preview='~/.lessfilter {}'"

export FZF_ALT_C_COMMAND="fd --type dir $FD_COMMON_OPTS"
export FZF_ALT_C_OPTS="--preview='$EZA_PREVIEW'"

# https://github.com/junegunn/fzf?tab=readme-ov-file#environment-variables
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd $(echo $FD_COMMON_OPTS) . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type dir $(echo $FD_COMMON_OPTS) . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview "$EZA_PREVIEW {}"   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"  "$@" ;;
    ssh)          fzf --preview 'dig {}'            "$@" ;;
    *)            fzf --preview '~/.lessfilter {}'  "$@" ;;
  esac
}

# theme: rose-pine
# https://minsw.github.io/fzf-color-picker/
# fast-theme -p
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#8976a3,bg:-1,hl:#b4637a
  --color=fg+:#c4a7e7,bg+:#1f1d2e,hl+:#eb6f92
  --color=prompt:#c4a7e7,spinner:#c4a7e7,pointer:#c4a7e7
  --color=border:#8976a3,scrollbar:#8976a3,separator:#8976a3
  --color=label:#8976a3,preview-label:#8976a3
  --color=info:#31748f,header:#31748f,marker:#f6c177'
