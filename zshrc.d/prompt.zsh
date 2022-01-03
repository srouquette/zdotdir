# prezto sorin prompt
# zstyle ':prezto:module:editor:info:keymap:primary' format ' %F{5}%%%f'

### pure prompt (https://github.com/sindresorhus/pure)
# create a patch by changing the code (no need to commit)
# and then running this command
# $ git diff > some-changes.patch
if [[ -d $ZPLUGINDIR/pure ]] &&
   [[ -f $ZDOTDIR/misc/pure-less-spacious.patch ]] &&
   [[ ! -f $ZPLUGINDIR/pure/pure-less-spacious.patch ]]
then
  cp $ZDOTDIR/misc/pure-less-spacious.patch $ZPLUGINDIR/pure
  echo "Patching pure prompt..."
  git -C "$ZPLUGINDIR/pure" apply $ZPLUGINDIR/pure/pure-less-spacious.patch
fi

### Starship prompt
# command -v starship &>/dev/null || sh -c "$(curl -fsSL https://starship.rs/install.sh)"
# export STARSHIP_CONFIG=~/.config/starship/zsh.toml
# eval "$(starship init zsh)"
