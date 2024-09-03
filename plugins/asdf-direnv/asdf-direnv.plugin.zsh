#
# asdf-direnv: hook direnv with asdf if both are installed
# https://github.com/redxtech/zsh-asdf-direnv
#

(( $+commands[asdf] )) || return 1
[ -z "$MSYSTEM" ] || return 1  # doesn't work on msys2

ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"

# if the direnv asdf plugin isn't installed, add it
if ! asdf plugin list 2>/dev/null | grep direnv >/dev/null; then
  asdf plugin add direnv
fi

# if there isn't a version of direnv installed, install the latest
if test ! "$(asdf list direnv 2>/dev/null | wc -l)" -gt 0; then
  asdf install direnv latest
  asdf global direnv latest
fi

# install hook
if zstyle -t ':zephyr:plugin:asdf-direnv' 'use-cache'; then
  cached-eval 'asdf-direnv-hook' asdf exec direnv hook zsh
else
  eval "$(asdf exec direnv hook zsh)"
fi
