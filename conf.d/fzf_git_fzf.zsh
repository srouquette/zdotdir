# https://github.com/junegunn/fzf-git.sh
# Redefine this function to change the options

_fzf_git_fzf() {
  fzf-tmux -p80%,60% -- \
    --layout=reverse --multi --height=70% --min-height=20 --border \
    --border-label-pos=2 \
    --color='header:italic:underline,label:blue' \
    --preview-window='right,70%,border-left' \
    --bind='ctrl-x:change-preview-window(hidden|)' "$@"
}
