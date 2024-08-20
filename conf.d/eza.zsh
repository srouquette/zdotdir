#
# Configure eza
#

[ $(command -v eza 2>&1) ] || exit 0

alias ls='eza -lh --group-directories-first --git --icons --color-scale all --hyperlink --octal-permissions'
alias lh='ls -d .*'
alias lD='ls -D'
alias lc='ls -1'

alias la='ll -a'

alias lA='la --sort=acc'
alias lC='la --sort=cr'
alias lM='la --sort=mod'
alias lS='la --sort=size'
alias lX='la --sort=ext'
alias llm='lM'

alias lx='l -HimUuS'
alias lxa='lx -Z@'

alias lt='ls -T'
alias tree=lt
