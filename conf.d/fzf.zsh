#
# Configure fzf
#

command -v fzf &>/dev/null || exit 0

# fd is better than rg to search file
# export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

# -E .git -E node_modules...
local fd_exclude="${FIND_EXCLUDE_LIST[@]/#/-E }"
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --color=always --layout=default $fd_exclude"

export FZF_DEFAULT_OPTS="--ansi --reverse --height=50%
  --walker-skip $GREP_EXCLUDE
  --bind 'shift-up:preview-half-page-up'
  --bind 'shift-down:preview-half-page-down'
  --bind 'preview-scroll-up:preview-up+preview-up+preview-up+preview-up'
  --bind 'preview-scroll-down:preview-down+preview-down+preview-down+preview-down'"

# use .lessfilter instead of less to avoid paging, which cut the content randomly
export FZF_CTRL_T_OPTS="--preview='~/.lessfilter {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --recurse --level 3 --only-dirs --icons --color=always {}'"

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
