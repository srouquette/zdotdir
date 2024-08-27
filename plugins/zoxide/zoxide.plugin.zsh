#
# zoxide: smarter cd command, inspired by z and autojump.
# https://github.com/ajeetdsouza/zoxide
#

if (( $+commands[zoxide] )); then
  cached-eval 'zoxide-init-zsh' zoxide init zsh
else
  eval "$(zoxide init zsh)"
fi
