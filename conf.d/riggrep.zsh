#
# Configure bat
#

[ $(command -v rg 2>&1) ] || exit 0

# .git,node_modules...
alias grep="rg --smart-case --color=always --glob '!{$GREP_EXCLUDE}'"

alias frg='fzf-rg'
