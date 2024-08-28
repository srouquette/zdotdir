#
# zoxide: smarter cd command, inspired by z and autojump.
# https://github.com/ajeetdsouza/zoxide
#

(( $+commands[zoxide] )) || return 1

if zstyle -t ':zephyr:plugin:directory' 'use-cache'; then
  cached-eval 'zoxide-init-zsh' zoxide init zsh
else
  eval "$(zoxide init zsh)"
fi
