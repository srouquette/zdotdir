#
# zoxide: smarter cd command, inspired by z and autojump.
# https://github.com/ajeetdsouza/zoxide
#

(( $+commands[zoxide] )) || return 1

cached-eval 'zoxide-init-zsh' zoxide init zsh
